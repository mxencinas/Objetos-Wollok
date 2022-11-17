import clima.*

class Vehiculo
{
	const ruedas = #{}
	
	method velocidadBase()
	
	method velocidadVehiculo() = self.velocidadBase() - clima.resistenciaDelViento()
	
	method velocidadFinal(ruta) = self.velocidadVehiculo().min(ruta.velocidadMaxima())
	
	method tiempo(ruta) = ruta.kilometros() / self.velocidadFinal(ruta)
	
	method desgastarRuedas(nivelDesgaste)
	{
		ruedas.forEach{rueda => rueda.desgastar(nivelDesgaste)}
	}
	
	method viajar(ruta)
	{
		ruta.desgastar(self)
	}
	
	method estimarTiempoDeTour(camino) = camino.sum{ruta => self.tiempo(ruta)}
	
	method hacerTour(camino)
	{
		camino.forEach{ruta => self.viajar(ruta)}
	}
}

class VehiculoParticular inherits Vehiculo
{
	const velocidad
	
	override method velocidadBase() = velocidad
} 

class VehiculoCarga inherits Vehiculo
{
	const carga
	
	override method velocidadBase() = self.velocidadSegunCarga()
	
	method velocidadSegunCarga()
	{
		if (self.llevaCargaPesada()) return 60
		else return 80
	}
	
	method llevaCargaPesada() = carga >= 40
	
	override method desgastarRuedas(nivelDesgaste)
	{
		super(2 * nivelDesgaste)
	}
}

class VehiculoTransporte inherits Vehiculo
{
	const velocidad = 120
	
	var property pasajerosAbordo
	
	override method velocidadBase() = velocidad - pasajerosAbordo
	
}


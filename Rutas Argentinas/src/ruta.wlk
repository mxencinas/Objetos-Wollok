import clima.*

class Ruta
{
	const property kilometros
	
	var property tipo // tierra | ripio | asfalto
	
	method velocidadMaxima() = tipo.velocidadMaxima()
	
	method desgastar(vehiculo) = vehiculo.desgastarRuedas(self.nivelDesgaste(vehiculo))
	
	method nivelDesgaste(vehiculo) = tipo.nivelDesgaste(self, vehiculo)
	
	method mejorar() = tipo.mejorar(self)
	
}


class TipoRuta
{
	method nivelDesgaste(ruta, vehiculo) = vehiculo.velocidadFinal(self) / 10
	
	method velocidadMaxima()
	
	method mejorar(ruta)
}


object tierra inherits TipoRuta
{
	const velocidadBase = 60
	
	override method velocidadMaxima() = 10.max(velocidadBase - clima.precipitaciones())
	
	override method mejorar(ruta) 
	{
		ruta.tipo(ripio)
	}
	
}

object ripio inherits TipoRuta
{
	override method velocidadMaxima() = 80
	
	override method mejorar(ruta) 
	{
		ruta.tipo(new Asfalto(velocidadMaxima = 90))
	}
}

class Asfalto inherits TipoRuta
{
	var velocidadMaxima
	
	override method velocidadMaxima() = velocidadMaxima
	
	override method nivelDesgaste(ruta, vehiculo) = vehiculo.tiempo(ruta)
	
	override method mejorar(ruta) 
	{
		ruta.tipo(new Asfalto(velocidadMaxima = velocidadMaxima + 5 ))
	}
}










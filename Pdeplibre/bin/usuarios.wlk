
class Cupon
{
	var property estaUsado = false
	const property porcentajeDescuento
	
	method usar(monto)
	{
		if (not estaUsado) return monto * (1 - porcentajeDescuento)
		else return monto
	}
}


class Usuario
{
	const nombre
	var dinero = 0
	var puntos = 0
	var property nivel = bronce // composicion: bronce | plata | oro
	const productos = []
	const cupones = []
	
	method agregarAlCarrito(producto) 
	{ 
		if (not nivel.puedeAgregarAlCarrito(self,producto))
			self.error("Para agregar mas productos tenes que subir de nivel")

		productos.add(producto)
	}
	
	method cantidadProductos() = productos.size()
	
	method comprarCarrito() 
	{
		const precioTotal = self.precioFinalCarrito()
	
		self.descontar(precioTotal)
		
		self.sumarPuntos(precioTotal * 0.1)
	}  
	
	method precioFinalCarrito()
	{
		const precioCarrito = productos.forEach{ producto => producto.precioFinal()} 
		
		const porcentajeDeDescuento = self.porcentajeDescuento()
		
		return precioCarrito * (1 - porcentajeDeDescuento) 
	}
	
	method porcentajeDescuento()
	{
		const cuponesValidos = cupones.filter{ cupon => not cupon.estaUsado()}
		
		var porcentajeDeDescuento
		
		if (not cuponesValidos.isEmpty())  porcentajeDeDescuento = cuponesValidos.anyOne().porcentajeDescuento()
		else porcentajeDeDescuento = 0
		
		return porcentajeDeDescuento
	}
	
	method descontar(valor)
	{
		dinero -= valor
	}
	
	method sumarPuntos(valor)
	{
		puntos += valor 
	}
	
	method esMoroso() = dinero < 0
	
	method bajarPuntos(valor) { puntos -= valor}
	
	method cuponesInvalidos() = cupones.filter{cupon => cupon.estaUsado()}
	
	method quitarCupon(cuponInvalido) { cupones.remove(cuponInvalido)}
	
}

// logica repetida entre bronce y plata
object bronce
{
	const cantidadProductosPermitidos = 1
	const property puntajeMaximo = 5000
	
	method cumpleRequisitos(usuario) = usuario.puntos() < puntajeMaximo 
	
	method puedeAgregarAlCarrito(usuario,producto) = usuario.cantidadProductos() <= cantidadProductosPermitidos
}

object plata
{
	const cantidadProductosPermitidos = 5
	
	method puedeAgregarAlCarrito(usuario,producto) =  usuario.cantidadProductos() <= cantidadProductosPermitidos
}

object oro
{
	const property puntajeMinimo = 15000
	
	method cumpleRequisitos(usuario) = usuario.puntos() >= puntajeMinimo
	
	method puedeAgregarAlCarrito(usuario,producto) = true
}




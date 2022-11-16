class Producto
{
	const nombre
	const precioBase
	const iva = 0.21
	
	method precioConIva() = precioBase * (1 + iva)
	
	method precioFinal()
	
	method nombreDeOferta() = "SUPER OFERTA" + nombre
}

class Mueble inherits Producto
{
	const precioFlete = 1000
	
	override method precioFinal() = self.precioConIva() + precioFlete
	
}

class Indumentaria inherits Producto
{
	override method precioFinal() = self.precioConIva()
}

class Ganga inherits Producto
{
	override method precioFinal() = 0	
	
	override method nombreDeOferta() = nombre + " COMPRAME POR FAVOR"
}
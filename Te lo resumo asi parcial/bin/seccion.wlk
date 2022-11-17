class Seccion
{
	const property duracion
	const property speech
	
	method tieneCancion(cancion) = false
	
	method tieneReferencia() = false
}

class SeccionMusicalizada inherits Seccion
{
	const property cancion
	
	override method tieneCancion(nombreCancion) = cancion == nombreCancion
}

class SeccionConReferencia inherits Seccion
{
	const property referencia
	
	override method duracion() = super() + referencia.duracion() 
	
	override method speech() = super() + referencia.speech() 
	
	override method tieneReferencia() = true
}
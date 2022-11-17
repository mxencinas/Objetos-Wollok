import resumen.*

/*	RESUMEN ASI NOMAS
* 
* Punto 3
* 
* var resumenAsiNomas = new ResumenAsiNomas(introduccion = "una intro", factorDeVelocidad = 1.5)
*/

class ResumenAsiNomas inherits Resumen
{
	const resumenes = #{}
	const factorDeVelocidad
	
	method agregarResumen(resumen)
		{ resumenes.add(resumen) }
	
	override method duracion() = super() * factorDeVelocidad
}
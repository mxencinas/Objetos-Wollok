import seccion.*

/*	RESUMENES
* 
* Punto 1
* var resumen = new Resumen(introduccion = "una intro")
* var seccion = new Seccion(duracion = 10, speech = "algo")
* resumen.agregarSeccion(seccion)
*/

/*	
* Punto 2
* resumen.duracion()
*/

/*	
* Punto 3
* resumen.tieneCancion(nombreDeCancion)
*/

/*	
* Punto 4
* resumen.tieneReferencia()
*/

/*	
* Punto 5
* resumen.libreto()
*/

class Resumen
{
	const property introduccion
	const secciones = #{}
	var property likes = 0
	var property dislikes = 0
	
	method agregarSeccion(seccion)
		{	secciones.add(seccion)	}
	
	method duracion() = self.duracionSecciones() + self.duracionIntroduccion()
	
	method duracionSecciones() = secciones.sum { seccion => seccion.duracion() }
	
	method duracionIntroduccion() = introduccion.words().size() * 10
	
	method tieneCancion(nombreCancion) = secciones.any { seccion => seccion.tieneCancion(nombreCancion) }
	
	method tieneReferencia() = secciones.any { seccion => seccion.tieneReferencia()}
	
	method libreto() = introduccion + "." + self.speeches()
	
	method speeches() = secciones.map { seccion => seccion.speech() }.join(".")
	
	method sumarlike() { likes += 1 }

	method sumardislike() { dislikes += 1 }
}

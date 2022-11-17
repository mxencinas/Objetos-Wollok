/*	ESPECTADORES Y RESUMENES
* 
* Punto 2 A
* 
* var espectador = new Espectador(tiempoDispuestoAVer = 30, tipoEspectador = nuevoEspectador)
*/

/*	
* Punto 2 B
* 
*espectador.leGusta(resumen)
*/

class Espectador
{
	const tiempoDispuestoAVer
	var tipoEspectador 
	const property cancionesFavoritas = #{}
	
	method leGusta(resumen) = self.aceptaDuracion(resumen) && tipoEspectador.cumpleRequisitos(self, resumen)
	
	method aceptaDuracion(resumen) = resumen.duracion() <= tiempoDispuestoAVer
	
	method leGustaCancion(cancion) = cancionesFavoritas.any { cancionFavorita => cancionFavorita == cancion }	
	
	method tieneAlgunaCancionFavoritaEn(resumen) = cancionesFavoritas.any { cancion => resumen.tieneCancion(cancion) }
	
	method tieneSusCancionesFavoritasEn(resumen) = cancionesFavoritas.all { cancion => resumen.tieneCancion(cancion)}
}


object nuevoEspectador
{
	method cumpleRequisitos(espectador, resumen) = true
}

object follower
{
	method cumpleRequisitos(espectador, resumen) = espectador.tieneAlgunaCancionFavoritaEn(resumen)
}

object fan
{
	method cumpleRequisitos(espectador, resumen) = espectador.tieneSusCancionesFavoritasEn(resumen) && resumen.tieneReferencia()
	
}
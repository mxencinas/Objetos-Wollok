object canalYoutube
{
	const suscriptores = #{}
	const resumenes = #{}
	
	method agregarSuscriptor(suscriptor) 
		{ suscriptores.add(suscriptor) }
	
	method agregarResumen(resumen) 
	{ 
		const interesados = self.suscriptoresInteresados(resumen)
		
		if (interesados.isEmpty())
			self.error("El resumen NO le gusto a nadie")
		
		resumenes.add(resumen)
		interesados.forEach{suscriptor => suscriptor.agregarResumenPendiente(resumen)}
	}	
	
	method suscriptoresInteresados(resumen) = suscriptores.filter{ suscriptor => suscriptor.leGusta(resumen) }

	method suscriptoresAdictos() = suscriptores.filter{ suscriptor => suscriptor.esAdicto(resumenes) }
	
	method cancionesSolicitadas() = suscriptores.flatMap{suscriptor => suscriptor.cancionesFavoritas()}.asSet()
	
	method mejorResumen() = resumenes.max { resumen => resumen.likes()}
	
	method peorResumen() = resumenes.max { resumen => resumen.dislikes()}
	
}



import espectador.*


class Suscriptor inherits Espectador
{
	const resumenPendiente = #{}
	const property resumenesVistos = #{}
	
	method agregarResumenPendiente(resumen)
	{ 
			resumenPendiente.add(resumen)
	}
	
	method esAdicto(resumenes) = (resumenesVistos.size() / resumenes.size() ) >= 0.8
	
	method agregarResumenVisto(resumen)
		{ resumenesVistos.add(resumen) }
	
	method ver (resumen) 
	{
		self.agregarResumenVisto(resumen)
		
		if (self.leGusta(resumen))  self.darLike(resumen)
		else  self.darDislike(resumen)
		
	}
	
	method darLike(resumen) = resumen.sumarLike()
	
	method darDislike(resumen) = resumen.sumarDislike()
}


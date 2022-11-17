import usuarios.*

object pdepLibre 
{
	const usuarios = #{}
	const productos = []
	
	method penalizarMorosos()
	{
		const morosos = self.morosos()
		
		morosos.forEach{ moroso => self.penalizar(moroso)}
	}
	
	method morosos() = 	usuarios.filter{ usuario => usuario.esMoroso()}
	
	method penalizar(moroso) { moroso.bajarPuntos(1000)}
	
	method sacarCuponesInvalidos() = usuarios.forEach{ usuario => self.quitarCuponesInvalidos(usuario)}
	
	method quitarCuponesInvalidos(usuario)
	{
		const cuponesInvalidos = usuario.cuponesInvalidos()
		
		cuponesInvalidos.forEach{cuponInvalido => usuario.quitarCupon(cuponInvalido)}
		
		// cupones.removeAllSuchThat({cupon => cupon.fueUsado()})
	}
	
	method nombresDeOferta() = productos.map{producto => producto.nombreDeOferta()}
	
	method actualizarNiveles() 
	{
		usuarios.forEach{ usuario => self.actualizarNivel(usuario)}
	}
	
	method actualizarNivel(usuario) 
	{
		if ( bronce.cumpleRequisitos(usuario) )
			usuario.nivel(bronce)
		else if (oro.cumpleRequisitos(usuario) )
			usuario.nivel(oro)
		else
			usuario.nivel(plata)
	}
	
}

import socios.*

class Actividad{
    const property idiomas = #{}

	method dias() 
	method implicaEsfuerzo()
	method siveParaBroncearse()
	method esRecomendadaPara(unSocio)
}

class Viaje inherits Actividad{
	method viajeInteresante() = idiomas.size() > 1
	method quitarIdioma(unIdioma){idiomas.remove(unIdioma)}
	method agregarUnIdioma(unIdioma){idiomas.add(unIdioma)}
	override method esRecomendadaPara(unSocio) = self.viajeInteresante() and unSocio.leAtrae(self) and not unSocio.realizoLaAct(self) 
}

class ViajeDePlaya inherits Viaje{
	const property largoPlaya
	
	override method dias() = largoPlaya / 500
	override method implicaEsfuerzo()= largoPlaya > 1200
	override method siveParaBroncearse()= true
}
class ExcursionACiudad inherits Viaje{
	var property cantAtracciones
	override method dias() = cantAtracciones/ 2
	override method implicaEsfuerzo()= cantAtracciones.between(5,8)
	override method siveParaBroncearse()= false
	override method viajeInteresante() = super() or cantAtracciones == 5
}
class ExcursionTropical inherits ExcursionACiudad{
	override method dias()= super() + 1
	override method siveParaBroncearse()= true
}
class SalidaDeTrekking inherits Viaje{
	var property kms
	var property diasDeSol
	override method viajeInteresante() = super() or diasDeSol > 140
	override method dias() = kms / 50
	override method implicaEsfuerzo()= kms > 80
	override method siveParaBroncearse()= diasDeSol > 200 or (diasDeSol.between(100,200) and kms > 120)
}
class ClaseDeGimnasia inherits Actividad{
	
	override method dias() = 1
	override method implicaEsfuerzo()= true
	override method siveParaBroncearse()= false
	method initialize(){
		if(idiomas != #{"Español"})
		self.error("solo se permite español")
	}
	override method esRecomendadaPara(unSocio) = unSocio.edad().between(20,30)
	
}
class TallerLiterario{
    const librosEnQueTrabaja = #{}
	
	method idiomas() = librosEnQueTrabaja.map({l => l.idioma()}).asSet()
    method diasDeActividad() = librosEnQueTrabaja.size() + 1
    method tieneLibroConMasDe500Pag() = librosEnQueTrabaja.any({l => l.cantPaginas() > 500})
    method autoresDeLibros() = librosEnQueTrabaja.map({l => l.nombreDelAutor()}).asSet()
    method todosLosLibrosSonDelMismoAutor() = self.autoresDeLibros().size() == 1
    method hayMasDeUnLibro() = librosEnQueTrabaja.size() > 1
    method implicaEsfuerzo() = self.tieneLibroConMasDe500Pag() or (self.todosLosLibrosSonDelMismoAutor() and self.hayMasDeUnLibro())
    method sirveParaBroncearse() = false
    method esRecomendadaPara(unSocio) = unSocio.idiomas().size() > 1
}

class Libro{
    const property idioma
    const property cantPaginas
    const property nombreDelAutor
}
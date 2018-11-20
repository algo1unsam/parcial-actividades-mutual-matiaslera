import socio.*

class Actividad { // No se hereda nada

	var idiomasUsados = []

	method idiomasUsados()

	method implicaFuerza()

	method sirveParaBroncearse()

	method cuantosDiasDeActividas()

	method viajeInteresante()

	method esRecomendablePara(socio)

}

class Viaje inherits Actividad {

	override method idiomasUsados() = idiomasUsados

	override method viajeInteresante() = idiomasUsados.size() > 2

	override method esRecomendablePara(socio) = self.viajeInteresante() && socio.lactividadEsAtractiva() && !socio.actividades().contains(self)

}

class Idioma {

}

class ViajeDePlaya inherits Viaje {

	var property largoDePlaya = 1000

	override method cuantosDiasDeActividas() = largoDePlaya / 500

	override method implicaFuerza() = largoDePlaya > 1200

	override method sirveParaBroncearse() = true

}

class ExcursionALaCiudad inherits Viaje {

	var property cantidadDeAtracciones = 10

	override method cuantosDiasDeActividas() = cantidadDeAtracciones / 2

	override method implicaFuerza() = cantidadDeAtracciones >= 5

	override method sirveParaBroncearse() = false

	override method viajeInteresante() = cantidadDeAtracciones == 5 or super()

}

class ExcursionALaCiudadTropical inherits ExcursionALaCiudad {

	override method cuantosDiasDeActividas() = super() + 1

	override method sirveParaBroncearse() = true

}

class SalidaDeTrekking inherits Viaje {

	var property kilometroDeSendero = 100
	var property diasDeSol = 185

	override method cuantosDiasDeActividas() = kilometroDeSendero / 50

	override method implicaFuerza() = kilometroDeSendero >= 80

	override method sirveParaBroncearse() = (diasDeSol > 200) or self.condicion()

	override method viajeInteresante() = super() && diasDeSol > 140

	method condicion() = (100 > diasDeSol && diasDeSol < 200) && (kilometroDeSendero > 120)

}

class ClaseDeGimnasia inherits Actividad {
	
	override method idiomasUsados()=[]

	override method cuantosDiasDeActividas() = 1

	override method implicaFuerza() = true

	override method sirveParaBroncearse() = false

	override method viajeInteresante() = false // no dice nada el enunciado

	override method esRecomendablePara(socio) = socio.edad() > 20 && 30 < socio.edad()

}

class TallerLiterio inherits Actividad {

	var libros = []

	override method idiomasUsados() = libros.map({ libro => libro.idioma() })

	override method cuantosDiasDeActividas() = libros.size() + 1

	override method sirveParaBroncearse() = false

	override method implicaFuerza() = self.libroMuchasHojas() or self.librosDelMismoAutor()

	method libroMuchasHojas() = libros.any({ libro => libro.cantidadPagina() > 500 })

	method librosDelMismoAutor() = libros.filter({ libro => libro.autor() }).asList().size() < libros.size()

	override method esRecomendablePara(socio) = socio.idiomaHablado().size() > 1

}

class Libros {

	var property autor
	var property cantidadPagina
	var property idioma

}


import actividad.*

class Socio {

	var actividades = []
	var property maximoDeActividades= 5
	var property edad = 24
	var idiomaHablado= []

	method agregarActividades(actividad) {
		if (maximoDeActividades>actividades.size())
		actividades.add(actividad)
		else self.error ("no se puede agregar Actividad")
	}
 
	method esAdoradorDelSol() = actividades.all({ actividad => actividad.sirveParaBroncearse() })
	
	method actividadesReforzadas() = actividades.filter({actividad=>actividad.implicaFuerza()})
	
	method lactividadEsAtractiva(actividad)
}

class SocioTranquilo inherits Socio{
	override method lactividadEsAtractiva(actividad)=actividad.cuantosDiasDeActividas()>=4
}
class SocioCoherente inherits Socio{
override method lactividadEsAtractiva(actividad){
	if (self.esAdoradorDelSol()) actividades.all({act=>act.sirveParaBroncearse()})
	else actividades.all({act=>act.implicaFuerza()})
}
}
class SocioRelajado inherits Socio{
	override method lactividadEsAtractiva(actividad){
		idiomaHablado.contains({idioma=>idioma==actividad.idiomasUsados()})
	}
}



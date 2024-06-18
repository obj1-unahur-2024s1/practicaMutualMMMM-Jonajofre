import viajes.*

class Socio {
	var actRealizadas = []
	var property maximoDeAct
	var property edad 
	var property idiomasQueHabla = #{}
	
	method agregarAct(unaActividad) {actRealizadas.add(unaActividad)}
	method actividadesRealizadas() = actRealizadas
	method adoradorSol() = actRealizadas.all({a => a.siveParaBroncearse()})
    method actEsforzadas()= actRealizadas.filter({a => a.implicaEsfuerzo()})
    method realizarAct(unaActividad){
    	if(actRealizadas.size() == maximoDeAct){
    		self.error("llego al maximo de act")
    	}
    	self.agregarAct(unaActividad)
    }
    method leAtrae(unaActividad)
    method realizoLaAct(unaActividad) = actRealizadas.contains(unaActividad)
}

class SocioTranquilo inherits Socio{
	override method leAtrae(unaActividad) = unaActividad.dias() >= 4
}
class SocioCoherente inherits Socio{
	override method leAtrae(unaActividad) = 
	if(self.adoradorSol())unaActividad.siveParaBroncearse() else unaActividad.implicaEsfuerzo()
	}
	
class SocioRelajado inherits Socio{
	override method leAtrae(unaActividad) =
    not idiomasQueHabla.intersection(unaActividad.idiomas()).isEmpty()
	}
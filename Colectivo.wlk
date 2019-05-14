object colectivo{
	
	const si = true
	const no = false
	const maxCombustible = 100
	const maxPasajeros = 30
	const haciaInicio 	= 0
	const haciaTerminal = 1
	
	/* Paradas */
	const Inicio 	= 0
	const Belgrano 	= 1
	const Coghlan 	= 2
	const Palermo 	= 3
	const Pilar 	= 4
	const Terminal 	= 5
	
	var direccion = haciaTerminal
	var recaudacion = 0
	var parada = 0
	var combustible = maxCombustible
	var genteParada = 0
	var genteSentada = 0
	var pasajeros = genteParada + genteSentada
	
	method consumirCombustible(km) = return combustible -= km * 10 + pasajeros * 0.2
	method establecerEstacion(km){
		if(direccion == haciaTerminal) parada += km
		else parada -= km
	}
	method combustibleActual() = return combustible
	method verificarDestino(destino){
		if(destino > Terminal or destino) return no
		else return si
	}
	method hayCombustible(){
		if(combustible == 0) return si 
		else return no
	}
	
	method avanzar(km){
		if(not self.verificarDestino(km)) return "No podes avnazar esos km"
		if(not self.hayCombustible()) return "Ya no queda más combustible"
		else{
			self.establecerEstacion(km)
			self.consumirCombustible(km)
			return "Se llego a la estacion"
		}
	}
}

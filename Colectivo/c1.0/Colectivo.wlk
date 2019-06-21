object colectivo{
	const si = true
	const no = false

	const pasajeroMaximo = 50
	const combustibleMaximo = 120
	const combustibleMinimo = 1
	const maximaParada = 5
	const minimaParada = 0
	const maxAsientos = 30 

	const haciaInicio = 0
	const haciaTerminal = 1

	var totalPersonas = 1
	var personasParadas  = 0
	var personasSentadas = 0

	var direccion = haciaTerminal
	var numeroParada = minimaParada
	var combustible = combustibleMaximo
	var recaudacion = 0

	method pasajerosActual(){
		totalPersonas = personasParadas + personasSentadas
		console.println("Personas paradas " + personasParadas)	
		console.println("El total de pasajeros son " + totalPersonas)	
	}

	method combustibleActual() = return combustible
	method consumirCombustible(km){
		combustible -= km * 10 + totalPersonas * 0.2 /* 10 corresponde a los litros */
	}
	method hayCombustible(){
		if(combustible <= combustibleMinimo){
			combustible = 0
			return no 
		}else return si
	}

	method establecerDireccion(){
		if(numeroParada == maximaParada and direccion == haciaTerminal) direccion = haciaInicio
		else if(numeroParada == minimaParada and direccion == haciaInicio) direccion = haciaTerminal
	}
	method establecerParada(km){
		if(direccion == haciaTerminal) numeroParada += km
		else numeroParada -= km
		
	}
	method verificarDestino(destino){
		if(destino > maximaParada or destino < minimaParada) return no
		else return si
	}
	method establecerPasajeros(cantidad){
		if(totalPersonas + cantidad < pasajeroMaximo){
			if(personasSentadas + cantidad > maxAsientos) personasParadas += (personasSentadas + cantidad) - maxAsientos
			else personasSentadas += cantidad
			totalPersonas = personasSentadas + personasParadas
		}else console.println("No queda espacio para más personas")
	}

	method avanzar(km){
		if(not self.verificarDestino(km)) return "No podes avanzar esos km"
		if(not self.hayCombustible()) return "Ya no queda más combustible"
		else{
			self.establecerPasajeros(personas.subir())
			self.establecerDireccion()
			self.establecerParada(km)
			self.consumirCombustible(km)
			self.hayCombustible()
			self.cobrarTarifa(personas.subir())
			if(direccion == haciaInicio and numeroParada == minimaParada){
				totalPersonas = 0
				personasParadas  = 0
				personasSentadas = 0
				recaudacion = 0
			}
			return "Se llego a la estacion: " + numeroParada
		}
	}
	method cargarCombustible(litros){
		if(numeroParada == maximaParada){
			recaudacion -= litros*2
			combustible += litros
			return "Se recargo exitosamente el combustible"
		}else return "Solo en la ultima parada puedes cargar combustible"
	}
	method cobrarTarifa(cantidad){
		if(direccion == haciaTerminal and numeroParada == maximaParada-1) recaudacion+=5*cantidad
		else if(direccion== haciaInicio and numeroParada == minimaParada+1) recaudacion+=5*cantidad
		else recaudacion+=20*cantidad 
		}
	method recaudacionActual() = return recaudacion
	}

/* Personas a subir */
object personas{
	var cantidadASubir = 10
	var cantidadABajar = 0
	method establecerTotalAsubir(cantidad){ cantidadASubir = cantidad }
	method establecerTotalABajar(cantidad){ cantidadABajar = cantidad }
	method subir(){
		cantidadASubir -= cantidadABajar
		return cantidadASubir
	}
	method bajar() = return cantidadABajar
}  

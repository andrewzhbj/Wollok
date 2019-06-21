const si = true
const no = false

const ultimaParada = 5
const primeraParada = 0
const pasajerosMaximo = 50

object colectivo{
	const haciaInicio = 0
	const haciaTerminal = 1
	
	var numeroParada = 0
	var direccion = haciaTerminal
	
	method avanzar(){
		if(self.hayPersonasAsubir() or self.hayPersonasAbajar()) return "Quedan personas por subir o bajar"
		else if(not combustible.verificar()) return "No queda combustible"
		else{
			self.establecerDireccion()
			self.establecerParada()
			combustible.consumir()
			if(numeroParada == ultimaParada or numeroParada == primeraParada){
				pasajeros.reiniciar()
				console.println("Se bajaron todos los pasajeros")
			}
			return "Se llego a la parada" + numeroParada
		}
	}
	method establecerDireccion(){
		if(numeroParada == ultimaParada and direccion == haciaTerminal) direccion = haciaInicio
		else if(numeroParada == primeraParada and direccion == haciaInicio) direccion = haciaTerminal
	}
	
	method establecerParada(){
		if(direccion == haciaTerminal) numeroParada += 1
		else numeroParada -= 1
	}
	method paradaActual() = return numeroParada
	
	method subirPersona(sentado, destino){
		if(numeroParada == 0) return "No se suben personas en el inicio"
		if(numeroParada == 5) return "No se suben personas en la terminal"
		else{
			if(self.hayPersonasAsubir() and pasajeros.totales() < pasajerosMaximo){
				pasajeros.aumentar(sentado)
				destino.aumentarPersonaBajar()
				recaudacion.cobrar(numeroParada)
				if(numeroParada == 1) thames.restarPersonaSubir()
				if(numeroParada == 2) liniers.restarPersonaSubir()
				if(numeroParada == 3) palermo.restarPersonaSubir()
				if(numeroParada == 4) saavedra.restarPersonaSubir()
				return "Se subio correctamente una persona"
			}else return "No se puede subir mas personas o el colectivo esta lleno"
		}
		
	}
	method hayPersonasAsubir(){
		if(numeroParada == 1){
			if(thames.totalAsubir() > 0) return si
			else return no
		}else if(numeroParada == 2){
			if(liniers.totalAsubir() > 0) return si
			else return no
		}else if(numeroParada == 3){
			if(palermo.totalAsubir() > 0) return si
			else return no
		}else if(numeroParada == 3){
			if(saavedra.totalAsubir() > 0) return si
			else return no
		}else return no
	}
	
	method hayPersonasAbajar(){
		if(numeroParada == 1){
			if(thames.totalAbajar() > 0) return si
			else return no
		}else if(numeroParada == 2){
			if(liniers.totalAbajar() > 0) return si
			else return no
		}else if(numeroParada == 3){
			if(palermo.totalAbajar() > 0) return si
			else return no
		}else if(numeroParada == 3){
			if(saavedra.totalAbajar() > 0) return si
			else return no
		}else return no
	}
	
	method bajarPersona(){
		if(numeroParada == 0) return "No se bajan personas en el inicio"
		if(numeroParada == 5) return "Ya se bajaron todas las personas"
		if(self.hayPersonasAbajar()){
			if(numeroParada == 1) thames.restarPersonaBajar()
			if(numeroParada == 2) liniers.restarPersonaBajar()
			if(numeroParada == 3) palermo.restarPersonaBajar()
			if(numeroParada == 4) saavedra.restarPersonaBajar()
		}else return "Ya no quedan personas por bajar"
		return "Se bajo correctamente una persona"
	}
}

object pasajeros{
	var sentados = 0
	var parados = 0
	var total = 1
	
	method aumentar(sentado){
		if(sentado) return sentados++
		else return parados++
	}
	method actual(){
		total = parados + sentados
		console.println("Personas paradas " + parados)	
		console.println("Personas sentadas " + sentados)	
		console.println("Total " + total)
	}
	method totales(){
		total = parados + sentados
		return total
	}
	method reiniciar(){
		sentados = 0
		parados = 0
		total = 1
	}
	
}

object combustible{
	const maximoCombustible = 120
	const minimoCombustible = 1
	var litros = maximoCombustible
	
	method actual() = return "La cantidad de litros es de " + litros + "l"
	method consumir(){
		litros -= 10 + pasajeros.totales() * 0.2
	}
	method verificar(){
		if(litros <= minimoCombustible){
			litros = 0
			return no
		}else return si
	}
	method cargar(cantidad){
		if(recaudacion.total() - cantidad*2 < 1) return "No tenes suficiente plata para cargar esa cantidad"
		if(colectivo.paradaActual() != ultimaParada) return "Solo podes recargar combustible en la terminal"
		else{
			recaudacion.restar(cantidad*2)
			litros += cantidad
			return "Has recargado combustible exitosamente"
		}
	}
}

object recaudacion{
	var dinero = 0
	method total() = return dinero
	method cobrar(parada){
		if(parada == primeraParada+1 or parada == ultimaParada-1) dinero += 5
		else dinero += 20
	}
	method restar(cantidad){
		dinero -= cantidad
	}
	method actual() = return "La recaudacion actual es de: " + dinero
}

object thames{
	var personasAsubir = 2
	var personasAbajar = 0
	method aumentarPersonaBajar() = personasAbajar++
	method restarPersonaSubir() = personasAsubir--
	method restarPersonaBajar() = personasAbajar--
	method totalAsubir() = return personasAsubir
	method totalAbajar() = return personasAbajar
	method info(){
		console.println("Cantidad de personas en la parada " + personasAsubir)
	}
}

object liniers{
	var personasAsubir = 2
	var personasAbajar = 0
	method aumentarPersonaBajar() = personasAbajar++
	method restarPersonaSubir() = personasAsubir--
	method restarPersonaBajar() = personasAbajar--
	method totalAsubir() = return personasAsubir
	method totalAbajar() = return personasAbajar
	method info(){
		console.println("Cantidad de personas en la parada " + personasAsubir)
	}
}
object palermo{
	var personasAsubir = 4
	var personasAbajar = 0
	method aumentarPersonaBajar() = personasAbajar++
	method restarPersonaSubir() = return personasAsubir--
	method restarPersonaBajar() = personasAbajar--
	method totalAsubir() = return personasAsubir
	method totalAbajar() = return personasAbajar
	method info(){
		console.println("Cantidad de personas en la parada " + personasAsubir)
	}
}
object saavedra{
	var personasAsubir = 3
	var personasAbajar = 0
	method aumentarPersonaBajar() = personasAbajar++
	method restarPersonaSubir() = personasAsubir--
	method restarPersonaBajar() = personasAbajar--
	method totalAsubir() = return personasAsubir
	method totalAbajar() = return personasAbajar
	method info(){
		console.println("Cantidad de personas en la parada " + personasAsubir)
	}
}

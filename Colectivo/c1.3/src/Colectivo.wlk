import Paradas.*
import Pasajeros.*
import Combustible.*
import Recaudacion.*

object colectivo{
	const primeraParada = 0
	const ultimaParada = 5
	const haciaInicio = -1
	const haciaTerminal = 1
	const maxPasajeros = 50
	var direccion = haciaTerminal
	var numeroParada = 0
	var nombreParada = inicio
	
	method direccion() = return direccion
	method parada() = return numeroParada
	method ubicacion() = return nombreParada.informacion()
	
	method avanzar(){
		if(combustible.verificarFuturoConsumo()) return "No hay combustible para avanzar"
		if(self.hayPersonasEsperando()) return "Aun quedan personas por subir" + " (" + nombreParada.totalSubir() + ")"
		if(self.hayPersonasBajar()) return "Aun quedan personas por bajar" + " ("  + nombreParada.totalBajar() + ")"
		self.establecerDireccion()
		self.establecerParada()
		self.verificarLlegada()
		combustible.consumir()
		return "Se llego a " + nombreParada
	}
	
	method establecerDireccion(){
		if(numeroParada == primeraParada) direccion = haciaTerminal
		if(numeroParada == ultimaParada) direccion = haciaInicio
	}
	
	method verificarLlegada(){
		if(numeroParada == ultimaParada or numeroParada == primeraParada){
			pasajeros.bajarTodos()
			console.println("Se bajaron todos los pasajeros")
		}
	}
	
	method establecerParada(){
		numeroParada += direccion
		if(numeroParada == 0) 
			nombreParada = inicio
		if(numeroParada == 1) 
			nombreParada = thames
		if(numeroParada == 2) 
			nombreParada = liniers
		if(numeroParada == 3) 
			nombreParada = palermo
		if(numeroParada == 4) 
			nombreParada = saavedra
		if(numeroParada == 5)
			nombreParada = terminal
	}
	
	method convertirParada(nombre){
		if(nombre == inicio)
			return 0
		if(nombre == thames) 	
			return 1
		if(nombre == liniers) 	
			return 2
		if(nombre == palermo) 	
			return 3
		if(nombre == saavedra) 	
			return 4
		if(nombre == terminal) 	
			return 5
		return -1
	}
	
	method hayPersonasBajar(){
		if(numeroParada == primeraParada or numeroParada == ultimaParada) return false
		if(nombreParada.totalBajar() > 0)
			if(nombreParada.totalBajar() > 0 and pasajeros.actual() == 50) return true
			else return (pasajeros.actual() < maxPasajeros)
		return false
	}
	
	method hayPersonasEsperando(){
		if(numeroParada == primeraParada or numeroParada == ultimaParada) return false
		if(nombreParada.totalSubir() > 0)
			return (pasajeros.actual() < maxPasajeros)
		return false
	}
	
	method verificarBajada(){
		if(direccion == haciaTerminal)
			return not (numeroParada == primeraParada+1 or numeroParada == primeraParada) 
		if(direccion == haciaInicio)
			return not (numeroParada == ultimaParada-1 or numeroParada == ultimaParada)
		return false
	}
	
	method verificarSubida(){
		if(direccion == haciaTerminal)
			return (numeroParada == primeraParada) 
		if(direccion == haciaInicio)
			return (numeroParada == ultimaParada)
		return true
	}
	
	method verificarDestino(nombre){
		if(direccion == haciaTerminal)
			return (self.convertirParada(nombre) <= numeroParada)
		if(direccion == haciaInicio)
			return (self.convertirParada(nombre) >= numeroParada)
		return true
	}
	
	method consumirTarifa(destino){
		if(direccion == haciaTerminal){
			if((self.convertirParada(destino) - numeroParada) == 1) recaudacion.sumar(5)
			else recaudacion.sumar(20)
		}
	}
	method subirPersona(destino){
		if(pasajeros.verificarCapacidad()) return "No queda mas espacio"
		if(not self.hayPersonasEsperando()) return "Ya no hay personas para subir"
		if(self.verificarSubida()) return "Aca no suben personas"
		if(self.verificarDestino(destino)) return "El destino no es valido"
		nombreParada.subirRestar()
		if(!(destino == terminal || destino == inicio)) destino.bajarSumar()
		pasajeros.aumentar()
		self.consumirTarifa(destino)
		return "Se subio correctamente un pasajero, destino: " + destino
	}
	
	method bajarPersonas(){
		if(not self.verificarBajada()) return "No hay personas a bajar"
		if(not self.hayPersonasBajar()) return "No hay mas personas para bajar"
		pasajeros.restar(nombreParada.totalBajar())
		nombreParada.personasQueBajaran(0)
		return "Se bajaron correctamente los pasajeros"
	}
}
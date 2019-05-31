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
	
	method avanzar(){
		if(combustible.verificarFuturoConsumo()) return "No hay combustible para avanzar"
		if(pasajeros.totales() < maxPasajeros and self.hayPersonasEsperando()) return "Aun quedan personas por subir o bajar"
		return "bien"
	}
	method paradaActual() = return nombreParada.informacion()
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
		if(numeroParada == 0) nombreParada = inicio
		if(numeroParada == 2) nombreParada = thames
		if(numeroParada == 2) nombreParada = thames
		if(numeroParada == 3) nombreParada = liniers
		if(numeroParada == 4) nombreParada = palermo
		if(numeroParada == 5) nombreParada = terminal
	}
	method hayPersonasEsperando(){
		if(numeroParada == primeraParada or numeroParada == ultimaParada) return false
		else return (nombreParada.totalAsubir() > 0 or nombreParada.totalAbajar() > 0)
	}
}

import Colectivo.*
import Pasajeros.*
import Recaudacion.*

object combustible{
	const minCombustible = 1
	var property maxCombustible = 30
	var property litros = maxCombustible
	
	method actual() = return litros
	method verificarFuturoConsumo(){
		return ((litros - 10 + pasajeros.actual() * 0.2) < minCombustible)
	}
	method consumir(){
		litros -= 10 + (pasajeros.actual() * 0.2)
		if(litros <= minCombustible) litros = 0
		return litros
	}
	method cargar(cantidad){
		if(not recaudacion.verificarGasto(cantidad)) return "No tienes suficiente dinero"
		if(colectivo.parada() != 5) return "Solo podes recargar en la terminal"
		recaudacion.restar(cantidad * 2)
		litros += cantidad
		return "Se recargo exitosamente el combustible"
	}
	
	
}
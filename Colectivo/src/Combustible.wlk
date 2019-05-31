import Colectivo.*
import Pasajeros.*
import Recaudacion.*

object combustible{
	const maxCombustible = 120
	const minCombustible = 1
	var property litros = maxCombustible
	
	method actual() = return litros
	method verificarFuturoConsumo(){
		return (self.consumir() < minCombustible)
	}
	method consumir(){
		litros -= 10 + (pasajeros.totales() * 0.2)
		return litros
	}
	method cargar(cantidad){
		if(not recaudacion.verificarGasto(cantidad)) return "No tienes suficiente dinero"
		if(colectivo.paradaActual() != 5) return "Solo podes recargar en la terminal"
		recaudacion.restar(cantidad * 2)
		litros += cantidad
		return "Se recargo exitosamente el combustible"
	}
	
	
}

object pasajeros{
	const maxCapacidad = 50
	var	property total = 0
	
	method verificarCapacidad(){
		return (total+1 == maxCapacidad+1)
	}
	method aumentar(){
		total++;
	}
	method restar(cantidad){
		total -= cantidad
	}
	method bajarTodos(){
		total = 0
	}
	method actual() = return total
}
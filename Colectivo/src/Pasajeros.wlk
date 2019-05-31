object pasajeros{
	var	property total = 0
	var property parados = 0
	var property sentados = 0
	
	method aumentar(sentado){
		if(sentado) sentados++
		else parados++
	}
	method totales(){
		total = parados + sentados
		return total
	}
	method bajarTodos(){
		sentados = 0
		parados = 0
		total = 0
	}
}

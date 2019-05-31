/* Primer modelo */
const maxBateria = 100
const samsungMaxMemory = 16000

object samsung{
	var bateria = 3
	var estado = false
	var memoria = 1000
	method bateriaActual(){
		return 'La batería actual es: ' + bateria + '%'
	}
	method cargarBateria(cantidad){
		if(bateria == maxBateria){
			return 'La batería está llena: ' + bateria + '%'
		}else{
			if(cantidad + bateria > 100) bateria = 100
			else bateria += cantidad
		}
		return 'Carga exitosa'
	}
	method sacarFoto(cantidad, flash){
		if(estado){
			if(memoria < samsungMaxMemory){
				memoria += cantidad*0.2
				if(flash) bateria -= cantidad*0.06	//Si el flash está prendido saca más batería.
				else bateria -= cantidad*0.03	
				if(bateria < 1) return self.apagar() + ', cargue la bateria' //Si la batería llega a 0 el celular se apaga.
				return 'Se tomaron ' + cantidad + ' captura/s con flash: ' + flash
			}else return 'El tiene memoria llena'
		}else return 'El Celular está apagado'
	}
	method prender(){
		if(estado) return 'El celular ya está prendido'	
		else{
			estado = true
			return 'El celular se prendio'
		}
	}
	method apagar(){
		if(not estado) return 'El celular ya está apagado'
		else{
			estado = false
			return 'El celular se apagó'	
		}
	}
} 

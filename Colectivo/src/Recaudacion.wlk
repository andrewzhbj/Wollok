import Colectivo.*

object recaudacion{
	var property dinero = 0
	
	method verificarGasto(cantidad) = return (dinero - cantidad < 1)
	method actual() = return dinero
	method restar(cantidad){
		dinero -= cantidad
	}
	method sumar(parada, direccion){
		if((parada == 4 and direccion == 1) or (parada == 1 and direccion == -1)) dinero += 5
		else dinero += 20
	}
	
	
}

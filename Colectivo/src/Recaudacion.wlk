import Colectivo.*

object recaudacion{
	var property dinero = 0
	
	method verificarGasto(cantidad) = return !(dinero - cantidad < 1)
	method actual() = return dinero
	method restar(cantidad){ dinero -= cantidad }
	method sumar(){
		if(colectivo.parada() == 4 and colectivo.direccion() == 1) dinero += 5
		else if(colectivo.parada() == 1 and colectivo.direccion() == -1) dinero += 5
		else dinero += 20
	}
}

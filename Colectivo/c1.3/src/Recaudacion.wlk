import Colectivo.*

object recaudacion{
	var property dinero = 0
	
	method verificarGasto(cantidad) = return !(dinero - cantidad < 1)
	method actual() = return dinero
	method restar(cantidad){ dinero -= cantidad }
	method sumar(cantidad){ dinero += cantidad }
}
const verdad = true
const falso  = false

object calculo{
	method sumar(numero, numeroAsumar) = return numero + numeroAsumar
	method restar(numero, numeroArestar) = return numero - numeroArestar
	
	method esIgual(primerDato, segundoDato){
		if(primerDato and segundoDato) return verdad
		else return falso
	}
	method esMayor(primerDato, segundoDato){
		if(primerDato > segundoDato) return verdad
		else return false
	}
	method esMenor(primerDato, segundoDato){
		if(primerDato > segundoDato) return verdad
		else return false
	}
}
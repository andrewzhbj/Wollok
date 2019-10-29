object wollok {
	
	const lista = [new Carta(1), new Carta(2), new Carta(3), new Carta(4)]
	
	method permutar(numero, coleccion){
		if(coleccion.any({x => x > coleccion.size()}))
			return false
		var listaNueva = coleccion.map({x => lista.get(x)})
		listaNueva.add(numero)
		var numerosMaximos = listaNueva.size()
		return (1 .. numerosMaximos).map({x => listaNueva.subList(0, x)})
	}
	
	
	method seleccionarCarta(numero){ return lista.get(numero) }
	
	method existe(carta){ return (lista.any({ x => x.numero() == carta.numero() })) }
}

class Carta{
	var property numero
	constructor(_numero){ numero = _numero }
}

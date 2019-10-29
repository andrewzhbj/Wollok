object wollok {
	
	const lista = [new Carta(1), new Carta(2), new Carta(3), new Carta(4)]
	
	method permutar(numero, coleccion){
		if(coleccion.any({x => (x > coleccion.size() or coleccion.size() < x)}))
			return false
		var listaNueva = coleccion.map({x => lista.get(x)})
		listaNueva.add(numero)
		return (1 .. listaNueva.size()).map({x => listaNueva.subList(0, x)})
	}
}

class Carta{
	var property numero
	constructor(_numero){ numero = _numero }
}

import wollok.game.*


object partida{
	var salas = [menu, creditos]
	var salaActual = 0
	
	method obtenerSala(numeroDeSala){ return salas.get(numeroDeSala) }
	
	method establecerMenuInicial(){
		menu.dibujarElementos()
		menu.mostrarAyuda()
	}
	
	method establecerSala(numeroDeSala){
		self.obtenerSala(salaActual).eliminarElementos()
		salaActual = numeroDeSala
		self.obtenerSala(salaActual).dibujarElementos()
	}

	method establecerAccesoDeTeclado(){
		if(salaActual == 0)
			keyboard.num1().onPressDo({ self.establecerSala(1) console.println("salacambiada" + salaActual)})

	}
}

class Texto{
	var property position
	var rutaImagen
	
	constructor(_ruta, _x, _y){
		rutaImagen = _ruta
		position = game.at(_x, _y)
	}
	
	method image(){ return rutaImagen }
}


object menu{
	var elementos = 
	[
		new Boton("Menu/btnJugar.png", game.width()/2.5, game.height()/2), 
		new Boton("Menu/btnCreditos.png", game.width()/2.5, game.height()/2.5),
		new Boton("Menu/btnSalir.png", game.width()/2.5, game.height()/3.5),
		new Texto("Menu/txtTitulo.png", 7, 11),
		new Ayudante(1, 1)
	]
	
	method dibujarElementos(){ elementos.forEach({ x => game.addVisualCharacter(x)}) }
	
	method eliminarElementos(){ elementos.forEach({ x => game.removeVisual(x) }) }
	
	method accionBotonCreditos(){ partida.establecerSala(2) }
	
	method mostrarAyuda(){ elementos.get(4).ayudaEnMenu() }
}

class Ayudante{
	var property position
	
	constructor(x, y){ position = game.at(x, y) }
	
	method image(){ return "ayudante.png" }
	
	method ayudaEnMenu(){ return game.say(self, "(1) Jugar, (2) Creditos, (3) Salir") }
}
object creditos{
	var elementos = 
	[
		new Texto("txtCreditos.png", 5, 5), 
		new Boton("btnVolver.png", 1, 1)
	]
	
	method dibujarElementos(){ 
		elementos.forEach({ x => game.addVisualCharacter(x)})
		game.say(elementos.get(1), "Apreta 1 para volver al menú!")
	}
	
	method eliminarElementos(){ elementos.forEach({ x => game.removeVisual(x)}) }
	
	method accionBotonVolver(){ partida.establecerSala(0) }
}

class Boton{
	var property position
	var rutaImagen
	
	constructor(_rutaImagen, _x, _y){
		rutaImagen = _rutaImagen
		position = game.at(_x, _y)
	}
	
	method image(){ return rutaImagen }
}

object botonVolver{
	var property position = game.at(game.width()/2.5, game.height()/2)
	
	method establecerPosicion(x, y){ position = game.at(x, y) }
	
	method image(){ return "btnJugar.png" }
}

object botonJugar{
	var property position = game.at(game.width()/2.5, game.height()/2)
	method image(){ return "btnJugar.png" }
}

object botonCreditos{
	var property position = game.at(game.width()/2.5, game.height()/2.5)
	method image(){ return "btnCreditos.png" }
}

object botonSalir{
	var property position = game.at(game.width()/2.5, game.height()/3.5)
	method image(){ return "btnSalir.png" }
}
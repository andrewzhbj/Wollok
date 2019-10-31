import wollok.game.*

object partida{
	var salas = [menu]
	var salaActual = 0
	
}

object menu{
	var elementos = [botonJugar, botonCreditos, botonSalir, ayuda]
	method dibujarElementos(){
		elementos.forEach({ x => game.addVisualCharacter(x)})
	}
}

object ayuda{
	var property position = game.at(game.width()/6, game.height()/2.5)
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
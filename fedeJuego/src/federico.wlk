import wollok.game.*

object federico{
	
	var property position = game.at(0,3)
	var property energy = 120
	
	method image(){
		return "fede.png"
	}
	
	method getEnergy(){ 
		return "" + energy
	}
	
	method hasEnergy(){
		return (energy == 0)
	}
	
	method walk(ms){
		if(energy == 0) energy = 0
		energy = energy - ms * 10
	}
	
	method moveTo(newPosition){
		self.walk(position.distance(newPosition))
		position = newPosition
	}
}

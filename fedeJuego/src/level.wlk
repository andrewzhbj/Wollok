import wollok.game.*
import federico.*

object level{
	
	method configureStart(){
		game.width(16)
		game.height(12)
		game.title("Fede nuts!")
		game.ground("tapete.png")
		game.addVisual(federico)
	}
	
	method configureKeys() {
		keyboard.left().onPressDo({ federico.moveTo(federico.position().left(1)) })
		keyboard.up().onPressDo({ federico.moveTo(federico.position().up(1)) })
		keyboard.down().onPressDo({ federico.moveTo(federico.position().down(1)) })
		keyboard.right().onPressDo({ federico.moveTo(federico.position().right(1))})
		keyboard.v().onPressDo({ game.say(federico, federico.getEnergy())})
	}
	
	method configureLimits(){
		if(not federico.hasEnergy())
			game.say(federico, "I not have energy!")
	}
}
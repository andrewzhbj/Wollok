object cartel{
	method paradas(){
		console.println("Parada 0: inicio")
		console.println("Parada 1: thames")
		console.println("Parada 2: liniers")
		console.println("Parada 3: palermo")
		console.println("Parada 4: saavedra")
		console.println("Parada 5: terminal")
	}
}
object inicio{
	method informacion(){
		console.println("Parada: Inicio")
		console.println("Numero de parada: 0")
	}
}
object thames{
	var property personasQueSubiran = 3
	var property personasQueBajaran = 0
	
	method informacion(){
		console.println("Parada: Thames")
		console.println("Numero de parada: 1")
		console.println("Personas esperando: " + personasQueSubiran)
	}
	method subirRestar() = personasQueSubiran--
	method bajarSumar() = personasQueBajaran++
	
	method totalSubir() = return personasQueSubiran
	method totalBajar() = return personasQueBajaran
}

object liniers{
	var property personasQueSubiran = 3
	var property personasQueBajaran = 0
	
	method informacion(){
		console.println("Parada: Liniers")
		console.println("Numero de parada: 2")
		console.println("Personas esperando: " + personasQueSubiran)
	}
	method subirRestar() = personasQueSubiran--
	method bajarSumar() = personasQueBajaran++
	
	method totalSubir() = return personasQueSubiran
	method totalBajar() = return personasQueBajaran
}
object palermo{
	var property personasQueSubiran = 3
	var property personasQueBajaran = 0
	
	method informacion(){
		console.println("Parada: Palermo")
		console.println("Numero de parada: 3")
		console.println("Personas esperando: " + personasQueSubiran)
	}
	method subirRestar() = personasQueSubiran--
	method bajarSumar() = personasQueBajaran++
	
	method totalSubir() = return personasQueSubiran
	method totalBajar() = return personasQueBajaran
}
object saavedra{
	var property personasQueSubiran = 3
	var property personasQueBajaran = 0
	
	method informacion(){
		console.println("Parada: Saavedra")
		console.println("Numero de parada: 4")
		console.println("Personas esperando: " + personasQueSubiran)
	}
	method subirRestar() = personasQueSubiran--
	method bajarSumar() = personasQueBajaran++
	
	method totalSubir() = return personasQueSubiran
	method totalBajar() = return personasQueBajaran
}

object terminal{
	method informacion(){
		console.println("Parada: Terminal")
		console.println("Numero de parada: 5")
	}
}
object inicio{
	method informacion(){
		console.println("Parada: Inicio")
		console.println("Numero de parada: 0")
	}
}
object thames{
	var property personasAsubir = 3
	var property personasAbajar = 0
	
	method informacion(){
		console.println("Parada: Thames")
		console.println("Numero de parada: 1")
		console.println("Personas esperando: " + personasAsubir)
	}
	method aumentarPersonaBajar() = personasAbajar++
	method aumentarPersonaSajar() = personasAbajar++
	method restarPersonaSubir() = personasAsubir--
	method restarPersonaBajar() = personasAbajar--
	method totalAsubir() = return personasAsubir
	method totalAbajar() = return personasAbajar
}

object liniers{
	var property personasAsubir = 3
	var property personasAbajar = 0
	method informacion(){
		console.println("Parada: Thames")
		console.println("Numero de parada: 1")
		console.println("Personas esperando: " + personasAsubir)
	}
	method aumentarPersonaBajar() = personasAbajar++
	method aumentarPersonaSajar() = personasAbajar++
	method restarPersonaSubir() = personasAsubir--
	method restarPersonaBajar() = personasAbajar--
	method totalAsubir() = return personasAsubir
	method totalAbajar() = return personasAbajar
}
object palermo{
	var property personasAsubir = 3
	var property personasAbajar = 0
	
	method informacion(){
		console.println("Parada: Thames")
		console.println("Numero de parada: 1")
		console.println("Personas esperando: " + personasAsubir)
	}
	method aumentarPersonaBajar() = personasAbajar++
	method aumentarPersonaSajar() = personasAbajar++
	method restarPersonaSubir() = personasAsubir--
	method restarPersonaBajar() = personasAbajar--
	method totalAsubir() = return personasAsubir
	method totalAbajar() = return personasAbajar
}
object saavedra{
	var property personasAsubir = 3
	var property personasAbajar = 0
	
	method informacion(){
		console.println("Parada: Thames")
		console.println("Numero de parada: 1")
		console.println("Personas esperando: " + personasAsubir)
	}
	method aumentarPersonaBajar() = personasAbajar++
	method aumentarPersonaSajar() = personasAbajar++
	method restarPersonaSubir() = personasAsubir--
	method restarPersonaBajar() = personasAbajar--
	method totalAsubir() = return personasAsubir
	method totalAbajar() = return personasAbajar	
}

object terminal{
	var property personasAsubir = 3
	var property personasAbajar = 0
	
	method informacion(){
		console.println("Parada: Thames")
		console.println("Numero de parada: 1")
		console.println("Personas esperando: " + personasAsubir)
	}
	method aumentarPersonaBajar() = personasAbajar++
	method aumentarPersonaSajar() = personasAbajar++
	method restarPersonaSubir() = personasAsubir--
	method restarPersonaBajar() = personasAbajar--
	method totalAsubir() = return personasAsubir
	method totalAbajar() = return personasAbajar
}
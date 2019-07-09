const hoy = new Date()
const calcularEdad = {n,m => n-m}
const sumar = {n,m => n+m}

object gatito{
    const fechaNacimiento = new Date(14, 01, 2014)
    var nombre = "Erick"
    var color = "Negro"
    method saberNombre(){ return nombre }
    method saberColor(){ return color }
    method edad(){ return calcularEdad.apply(hoy.year(),fechaNacimiento.year()) }
}
import profesionales.*
import universidades.*

class Persona {
	var property provincia
	
	method puedeSerAtendidoPorProfecional(profesional){
		return profesional.provinciasDondePuedeTrabajar().contains(provincia)
	}
}

class Institucion {
	const universidades = #{}
	
	method puedeSerAtendidoPorProfecional(profesional){
		return universidades.contains(profesional.universidad())
	}
	
	method agregarUniversidad(univ){
		universidades.add(univ)
	}
	
	method quitarUniversidad(univ){
		universidades.remove(univ)
	}
}

class Club {
	const provincias = #{}
	
	method puedeSerAtendidoPorProfecional(profesional){
		return not profesional.provinciasDondePuedeTrabajar().intersection(provincias).isEmpty()
	}
}

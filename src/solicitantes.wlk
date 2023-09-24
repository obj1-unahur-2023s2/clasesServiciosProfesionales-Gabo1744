import profesionales.*
import universidades.*

class Persona {
	var property provincia
	
	method puedeSerAtendidoPorProfecional(profesional){
		return profesional.provinciasDondePuedeTrabajar().any({p => p == provincia})
	}
}

class Institucion {
	const universidades = []
	
	method puedeSerAtendidoPorProfecional(profesional){
		return universidades.any({u => u == profesional.universidad()})
	}
}

class Club {
	const provincias = #{}
	
	method puedeSerAtendidoPorProfecionals(profesional){
		return profesional.provinciasDondePuedeTrabajar().any({p => provincias.any({pro => p == pro})})
	}
	
	method puedeSerAtendidoPorProfecional(profesional){
		return not profesional.provinciasDondePuedeTrabajar().intersection(provincias).isEmpty()
	}
}

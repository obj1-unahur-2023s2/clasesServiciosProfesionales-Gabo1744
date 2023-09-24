import profesionales.*
import universidades.*
import solicitantes.*

class Empresa {
	const profesionales = #{}
	var property honorarioDeReferencia
	const registroDeTrabajo
	
	method agregarProfecional(profesional){
		profesionales.add(profesional)
	}
	method quitarProfecional(profesional){
		profesionales.remove(profesional)
	}
	
	method cuantosEstudiaronEn(universidad){
		return profesionales.count({p=> p.universidad() == universidad})
	}
	
	method profecionalesCaros(){
		return profesionales.filter({p => p.honorariosPorHora() > honorarioDeReferencia})
	}
	
	method universidadesFormadoras(){
		return profesionales.map({p => p.universidad()}).asSet()
	}
	
	method profecionalMasBarato(){
		if (profesionales.isEmpty()){
			self.error("No hay profesionales en la empresa")
		}
		return profesionales.min({p => p.honorariosPorHora()})
	}
	
	method esDeGenteAcotada(){
		return profesionales.all({p => p.provinciasDondePuedeTrabajar().size() <= 3})
	}
	
	method puedeSatisfacerAUnSolicitante(solicitante){
		return profesionales.any({p => solicitante.puedeSerAtendidoPorProfecional(p)})
	}
}

import profesionales.*
import universidades.*
import solicitantes.*

class Empresa {
	const profesionales = #{}
	var property honorarioDeReferencia
	const clientes = #{}
	
	method agregarCliente(cliente){
		clientes.add(cliente)
	}
	
	method quitarCliente(cliente){
		clientes.remove(cliente)
	}
	
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
		return profesionales.all({p => self.largoProvincia(p) <= 3})
	}
	
	method largoProvincia(prof) {
		return prof.provinciasDondePuedeTrabajar().size()
	}
	
	method puedeSatisfacerAUnSolicitante(solicitante){
		return profesionales.any({p => solicitante.puedeSerAtendidoPorProfecional(p)})
	}
	
	method profecionalesQuePuedenAtenderA(solicitante){
		return profesionales.filter({p => solicitante.puedeSerAtendidoPorProfecional(p)})
	}
	
	method cantidadDeClientes() = clientes.size()
	
	method tieneComoClienteA(solicitante) = clientes.contains(solicitante)
	
	method darServicio(solicitante){
		if (not self.puedeSatisfacerAUnSolicitante(solicitante)){	
			self.error("Ningún profesional puede satisfacer al solicitante")
		}
		const profesional = self.profecionalesQuePuedenAtenderA(solicitante).anyOne()
		profesional.cobrar(profesional.honorariosPorHora())
		self.agregarCliente(solicitante)
	}
	
}

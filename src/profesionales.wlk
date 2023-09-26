import universidades.*

class ProfesionalAsociado {
	var property universidad
	const asociacion = asociacionDeProfecionalesDelLitoral
	
	method asociacion() = asociacion
	
	method provinciasDondePuedeTrabajar() {
		return #{"Entre Ríos", "Santa Fe","Corrientes"}
	}
	
	method honorariosPorHora() {
		return 3000
	}
	
	method cobrar(dinero){
		asociacion.totalRecaudado(dinero)
	}
}

class ProfesionalVinculado {
	var property universidad
	
	method provinciasDondePuedeTrabajar(){
		return #{universidad.provincias()}
	}

	method honorariosPorHora() = universidad.honorariosRecomendados()

	method cobrar(dinero){
		universidad.totalRecibidoPorDonaciones(dinero / 2)
	}

}

class ProfesionalLibre {
	var property universidad
	const provincias = #{}
	var property honorariosPorHora
	var totalRecaudado = 0
	
	method totalRecaudado() = totalRecaudado
	
	method provinciasDondePuedeTrabajar() = provincias
	
	method agregarProvincia(prov){
		provincias.add(prov)
	}
	
	method quitarProvincia(prov){
		provincias.remove(prov)
	}
	
	method cobrar(dinero){
		totalRecaudado += dinero
	}
	
	method pasarDinero(persLibre,cant){
		if (totalRecaudado < cant){
			self.error("No tiene la cantida suficiente")
		}
		totalRecaudado -= cant
		persLibre.cobro(cant)
	}
}

object asociacionDeProfecionalesDelLitoral{
	var totalRecaudado = 0
	
	method totalRecaudado() = totalRecaudado
	
	method totalRecaudado(cant){
		totalRecaudado += cant
	}
}

class Universidad {
	var property provincias
	var property honorariosRecomendados
	var totalRecibidoPorDonaciones = 0
	
	method totalRecibidoPorDonaciones() = totalRecibidoPorDonaciones
	
	method totalRecibidoPorDonaciones(cant){
		totalRecibidoPorDonaciones += cant
	}
}

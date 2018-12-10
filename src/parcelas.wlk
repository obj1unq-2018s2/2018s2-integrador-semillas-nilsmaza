import plantas.*

class Parcela{
	
	const largo
	const ancho
	var property horasDeSolXDia
	var property plantas = []
	
	method superficie() = ancho * largo
	
	method cantidadMaximaDePlantas() = if(ancho > largo) self.superficie() / 5 else self.superficie() / 3 + largo
	
	method tieneComplicaciones() = plantas.filter{planta => planta.horaDeSolQueTolera() < horasDeSolXDia }.size() > 1
	
	method plantarUnaPlanta(planta) { 
		if( (plantas.size() < self.cantidadMaximaDePlantas()) or ( (planta.horaDeSolQueTolera() - 2) < horasDeSolXDia ) )
			self.error("No hay mas espacio para plantar")
			else
			plantas.add(planta)
	}

}

class ParcelaEcologica inherits Parcela{
	
	
	
}

class ParcelaIndustrial inherits Parcela{
	
	
	
}

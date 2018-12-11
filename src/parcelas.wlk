import plantas.*

class Parcela{
	
	const largo
	const ancho
	const property horasDeSolXDia
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

	method plantaBienAsociada(planta) = true
	
	method numeroDePlantasBienAsociandas() = plantas.filter{planta => self.plantaBienAsociada(planta) }.size()
	
}

class ParcelaEcologica inherits Parcela{
	
	override method plantaBienAsociada(planta) = (not self.tieneComplicaciones()) and planta.parcelaIdeal(self)
	
}

class ParcelaIndustrial inherits Parcela{
	
	override method plantaBienAsociada(planta) = plantas.size() > 2 and planta.esFuerte()
	
}

object inta {
	
	var property parcelas = []
	
	method agregarParcela(parcela) { parcelas.add (parcela)}
	
	method promedioDePlantas() = parcelas.sum{ parcela => parcela.plantas().size() } / parcelas.size()
	
	method masSustentable() = parcelas.filter{ parcela => parcela.plantas().size() > 4 }.max{parcela => parcela.numeroDePlantasBienAsociandas()}
	
	
}

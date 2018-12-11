class Planta {
	
	const property anioDeObtecion
	const property altura

	
	method horaDeSolQueTolera() 
	
	method esFuerte() = self.horaDeSolQueTolera() > 10

	method daNuevasSemillas() = self.esFuerte()
	
	method espacioQueOcupa() 
	
}

class Menta inherits Planta{
	
	override method horaDeSolQueTolera() = 6
	
	override method daNuevasSemillas() = super() or altura > 0.4
	
	override method espacioQueOcupa() = altura * 3
	
	method parcelaIdeal(parcela) = parcela.superficie() > 6
	
}

class HierbaBuena inherits Menta{
	
	override method espacioQueOcupa() = super() * 2
		
}

class Soja inherits Planta {
	
	override method horaDeSolQueTolera() = if (altura.between(0.5,1)) 7 else self.segundaCondicion() 
	
	method segundaCondicion() = if((altura < 0.5)) 6 else 9 
	
	override method daNuevasSemillas() = super() or  anioDeObtecion > 2007 and altura > 1
	
	override method espacioQueOcupa() = altura / 2
	
	method parcelaIdeal(parcela) = parcela.horasDeSolXDia() == self.horaDeSolQueTolera()
	
}

class SojaTransgenica inherits Soja{
	
	override method daNuevasSemillas() = false
	
	override method parcelaIdeal(parcela) = parcela.cantidadMaximaDePlantas() == 1
	
}

class Quinoa {
	
	var property horaDeSolQueTolera
	const property anioDeObtecion
	const property altura
	
	 method esFuerte() = horaDeSolQueTolera > 10
	
	 method daNuevasSemillas() = self.esFuerte() or  anioDeObtecion < 2005
	
	 method espacioQueOcupa() = 0.5
	
	method parcelaIdeal(parcela) = parcela.plantas().all{planta => planta.altura() < 1.5 }
	
}



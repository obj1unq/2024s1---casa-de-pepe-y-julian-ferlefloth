import casa.*

object minimoIndispensable{
	var calidad = 1
	var casa = casaDePepeYJulian
	
	method asignarCasa(_casa){
		casa = _casa
	}
	
	method realizarManetnimiento(){
		
		if( !casa.tieneViveresSuficientes() ){
			casa.descuentaCuentaBancaria(self.gastar())
			casa.setPorcentajeDeViveres(casa.porcentajeDeViveres() + self.porcentajeDeViveresFaltantes()  )
		}
	}
	
	method porcentajeDeViveresFaltantes(){
		return casa.porcentajeDeViveres() - 40
	}
	
	method gastar(){
			return  self.porcentajeDeViveresFaltantes() * calidad
	}
	 
}

object full{
	var calidad = 5
	var casa = casaDePepeYJulian
	
	method asignarCasa(_casa){
		casa = _casa
	}
	
	method realizarManetnimiento(){
		
		if( casa.estaEnOrden() ){
			casa.descuentaCuentaBancaria(self.gastar())
			casa.setPorcentajeDeViveres(casa.porcentajeDeViveres() + self.porcentajeDeViveresFaltantes()  )
		}else{
			casa.descuentaCuentaBancaria(self.gastar())
			casa.setPorcentajeDeViveres(casa.porcentajeDeViveres() + self.porcentajeMinimoDeViveresFaltantes()  )
		}
	}
	
	method porcentajeDeViveresFaltantes(){
		return casa.porcentajeDeViveres() - 100
	}
	
	method porcentajeMinimoDeViveresFaltantes(){
		return casa.porcentajeDeViveres() - 40
	}
	
	method gastar(){
			return casa.porcentajeDeViveres() * calidad
	}
}
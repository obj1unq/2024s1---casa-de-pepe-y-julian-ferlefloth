
object casaDePepeYJulian {
	var porcentajeDeViveres = 50 //  viveres.porcentaje()
	var monto = 0 
	
	method monto(){
		return monto
	}
	 method tieneViveresSuficientes(){
		return porcentajeDeViveres > 40 	
	 }
 
	 method hayQueHacerReparaciones(){
	 	return monto > 0
	 }

	method estaEnOrden(){
		return !self.hayQueHacerReparaciones() && self.viveresSuficientes()
	}
	
	method rompe(montoAlRomper){
		monto = monto + montoAlRomper
	}
}

object viveres{
/*	var cantidadDeViveres = 5
	method porcentaje(){
		return cantidadDeViveres /
	}
 */	
}


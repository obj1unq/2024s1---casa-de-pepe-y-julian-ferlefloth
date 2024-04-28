import estrategiasDeAhorro.*
import cuentasBancarias.*

object casaDePepeYJulian {
	var porcentajeDeViveres = 40 
	var monto = 0 
	var cuentaBancaria = cuentaCombinada
	var estrategiaAhorro = minimoIndispensable
	
	method mantenimientoSemanal(){
	   estrategiaAhorro.asignarCasa(self)
	   estrategiaAhorro.realizarManetnimiento()
	}

	method porcentajeDeViveres(){
		return porcentajeDeViveres
	}
		
	method setCuentaBancaria(cuenta){
		cuentaBancaria = cuenta
	}
	method setPorcentajeDeViveres(_porcentajeDeViveres){
		porcentajeDeViveres = _porcentajeDeViveres
	}
	
	method setEstrategia(_estrategia){
		estrategiaAhorro = _estrategia
	}
	
	method saldoCuentaBancaria(){
		return cuentaBancaria.saldo()
	}
	
	method descuentaMontoEnCuentaBancaria(montoADescontar){
		cuentaBancaria.extraer(montoADescontar)
	}
	
	method monto(){
		return monto
	} 
	 method tieneViveresSuficientes(){
		return porcentajeDeViveres >=  40 	
	 }
 
	 method hayQueHacerReparaciones(){
	 	return monto > 0
	 }

	method estaEnOrden(){
		return !self.hayQueHacerReparaciones() && self.tieneViveresSuficientes()
	}
	
/* 	method hacerMantenimiento(montoEnPesos){
		monto = monto + montoEnPesos
		self.descuentaMontoEnCuentaBancaria(monto) 
	}
	
	method hacerMantenimientoSemanal(){
		porcentajeDeViveres = porcentajeDeViveres + estrategiaAhorro.comprarViveresFaltantes()
		self.hacerMantenimiento(estrategiaAhorro.gastar())
	}
*/
}



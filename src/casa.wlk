
object casaDePepeYJulian {
	var porcentajeDeViveres =40 //  viveres.porcentaje()
	var monto = 0 
	var cuentaBancaria = cuentaCombinada
	var estrategiaAhorro = minimoIndispensable
	
	
/* 	method comprarViveres(){
		porcentajeDeViveres = porcentajeDeViveres + estrategiaAhorro.comprar()
	}
*/
	method mantenimiento(montoDeMantinimiento){
		
		if(!self.estaEnOrden()){
			
			monto = monto + estrategiaAhorro.gastar()
			porcentajeDeViveres =  porcentajeDeViveres + estrategiaAhorro.porcentajeDeViveres()
			
		}
	}


	method porcentajeDeViveres(){
		return porcentajeDeViveres
	}
		
	method setCuentaBancaria(cuenta){
		cuentaBancaria = cuenta
	}
	method setPorcentajeDeViveres(porcentaje){
		porcentajeDeViveres = porcentaje
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
	
	method rompe(montoAlRomper){
		monto = monto + montoAlRomper
		self.descuentaMontoEnCuentaBancaria(monto) 
	}
}


object cuentaCorriente{
	var saldo = 0
	
	method saldo(){
		return saldo
	}
	
	method setSaldo(_saldo){
		saldo = _saldo
	}
	
	method depositar(monto){
		saldo = saldo + monto
	}
	
	method extraer(monto){
		saldo = saldo - monto
	}
	
	
}

object cuentaConGastos{
	var saldo = 0 
	var costo = 0
	
	method depositar(monto){
		saldo = saldo + monto - costo 
	}
	
	method costo(){
		return costo
	}
	
	method setCosto(_costo){
		costo = _costo
	}
	
	method extraer(monto){
		saldo = saldo - monto
	}
	
	method saldo(){
		return saldo
	}
}

object cuentaCombinada{
	var cuentaPrimaria = cuentaConGastos
	var cuentaSecundaria = cuentaCorriente
	var saldo = self.saldo()
	
	method saldo(){
		return cuentaPrimaria.saldo() + cuentaSecundaria.saldo()
	}
	
	method tieneSaldoSuficienteSegunMonto(monto){
		return (cuentaPrimaria.saldo() > monto)
	}
	
	method depositar(monto){
		cuentaPrimaria.depositar(monto)
	}
	
	method extraer(monto){
		if (self.tieneSaldoSuficienteSegunMonto(monto)) cuentaPrimaria.extraer(monto) else cuentaSecundaria.extraer(monto)
	}

}

object minimoIndispensable{
	var calidad = 0
	var porcentajeAComprar = self.porcentajeAComprar()
	
	method porcentajeAComprar(){
		return casaDePepeYJulian.porcentajeDeViveres() - 40
	}
	
	method gastar(){
		if ( !casaDePepeYJulian.tieneViveresSuficientes() ) {
			return  porcentajeAComprar * calidad;
		} else {
			return 0
		}
	}
}

object full{
	var calidad = 5
	var porcentaje = casaDePepeYJulian.porcentajeDeViveres()
		
	method porcentajeDeViveres(){
		return casaDePepeYJulian.porcentajeDeViveres() - 100
	}
	
	method gastar(){
			return porcentaje * calidad
	}
}

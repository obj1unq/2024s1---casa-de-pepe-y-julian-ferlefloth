 
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
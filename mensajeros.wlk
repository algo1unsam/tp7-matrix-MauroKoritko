object morfeo {
    var property vehiculo = camion
    const property peso = 90

    method peso(){
        return peso + camion.peso()
    } 
    method transporte(){
        return vehiculo
    }
}


object camion {
    var property peso = 500
    var property acoplado = 1

    method acoplados(cantidad){
        peso = peso * cantidad
    }
    method peso(){
        return peso
    } 
}

object monopatin {
    var property peso = 1

    method peso(){
        return peso
    }
}

object puente {

    method dejarPasar(mensajero){
      return mensajero.peso() < 1000
    }
}

object paquete {
    var property pago = null 

    method pago(pagado){
        pago = pagado
    }
    method estaPago(){
        return pago
    }
    method destino(lugar){
        return lugar
    }
    method pagar(){
        pago = true
        return pago
    }

    method puedeSerEntregadoPor(mensajero){
        return self.pagar() && puente.dejarPasar(mensajero) 

    }
}

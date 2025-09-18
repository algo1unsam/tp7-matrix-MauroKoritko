import mensajeria.*
import mensajeros.*


object paquetito {
   
    method precioTotal() {
        return 0
    }

    method estaPago() {
        return true
    }
    method puedeSerEntregadoPor(mensajero) {
        if (mensajeria.mensajeros().isEmpty()){
            return false 
        }        
            return puente.dejarPasar(mensajero)
    }
}
   
object paqueton {
    var property destinos = []
    var property pago = 0

    method agregarDestino(destino) {
        destinos.add(destino)
    }

    method precioTotal() {
        return 50 + (100 * destinos.size())
    }

    method pagar(monto) {
        pago = pago + monto
    }

    method estaPago() {
        return pago >= self.precioTotal()
    }

    method puedeSerEntregadoPor(mensajero) {
        if (mensajeria.mensajeros().isEmpty()){
            return false 
        }
        return self.estaPago() && puente.dejarPasar(mensajero)
       
    }
}

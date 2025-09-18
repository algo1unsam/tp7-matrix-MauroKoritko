import mensajeros.*

object mensajeria {
    var property mensajeros = #{}
    var property pendientes = []
    var property facturacion = 0

    method contratar(mensajero){
        mensajeros.add(mensajero)
    }
    method despedir(mensajero){
        mensajeros.remove(mensajero)
    }
    method despedirTodos(){
        mensajeros.clear()
    }
    method esGrande(){
        return self.mensajeros().size() > 2
    }
  
    method entregaPrimerEmpleado(){
        return self.mensajeros().asList().first().peso() < 1000 && paquete.estaPago()
    }
    
    method mensajerosQuePueden(paquete){
        return self.mensajeros().filter({mensajero => paquete.puedeSerEntregadoPor(mensajero) })
    }
    method tieneSobrepeso(){
        return self.mensajeros().map { mensajero => mensajero.peso() }.average() > 500
    }
    method enviar(paquete,mensajero){
        if (paquete.puedeSerEntregadoPor(mensajero)){
            facturacion = facturacion + paquete.precioTotal()
            return true
        }
        else pendientes.add(paquete)
        return false
    }
}












/*
 method puedeEntregar(paquete) {
        return self.mensajeros().any { mensajero => paquete.puedeSerEntregadoPor(mensajero) }
    }

    method mensajerosQuePueden(paquete) {
        return self.mensajeros().filter { mensajero => paquete.puedeSerEntregadoPor(mensajero) }
    }
    method sobrepeso() {
        return self.mensajeros().isEmpty().not() &&
               (self.mensajeros().map { mensajero => mensajero.peso() }.average() > 500)
    }
     method enviar(paquete) {
        if (self.puedeEntregar(paquete)) {
            var primerPaquete = self.mensajerosQuePueden(paquete).first()
            facturacion = facturacion + paquete.precioTotal()
        } else {
            pendientes.add(paquete)
        }
    }
    method facturacion() {
        return facturacion
    }

    method enviarTodos(lista) {
        lista.forEach { paquete => self.enviar(paquete) }
    }

    
    method enviarPendienteMasCaro() {
        var masCaro = pendientes.maxBy { paquete => paquete.precioTotal() }
        
        if (self.puedeEntregar(masCaro)) {
            self.enviar(masCaro)
            pendientes.remove(masCaro)
        }
        
    }*/

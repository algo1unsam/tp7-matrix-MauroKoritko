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
     method puedeEntregar(paquete) {
        return self.mensajeros().any { mensajero => paquete.puedeSerEntregadoPor(mensajero) }
    }
    method mensajerosQuePueden(paquete){
        return self.mensajeros().filter({mensajero => paquete.puedeSerEntregadoPor(mensajero) })
    }
    method tieneSobrepeso(){
        return self.mensajeros().map { mensajero => mensajero.peso() }.average() > 500
    }
    method enviar(paquete) {
        if (self.puedeEntregar(paquete)) {
            var primerPaquete = self.mensajerosQuePueden(paquete)
            facturacion = facturacion + paquete.precioTotal() 
        } else pendientes.add(paquete)
        
    }

     method facturacion() {
        return facturacion
    }

    method enviarTodos(lista) {
        lista.forEach { paquete => self.enviar(paquete) }
        pendientes.clear()
    }
   
    method enviarPendienteMasCaro() {
        var masCaro = pendientes.max({ paquete => paquete.precioTotal() }) 
        
        if (self.puedeEntregar(masCaro)) {
            self.enviar(masCaro)
            pendientes.remove(masCaro)
        }
        
    }
}

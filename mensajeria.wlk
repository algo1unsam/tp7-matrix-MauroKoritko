import mensajeros.*

object mensajeria {
    var property mensajeros = #{}

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

}
object paquetito {
    const property pago = true 
}

object paqueton {}


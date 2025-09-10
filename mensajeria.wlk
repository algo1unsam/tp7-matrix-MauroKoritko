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
}

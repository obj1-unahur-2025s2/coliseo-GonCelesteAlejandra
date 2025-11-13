import armas.*
import grupos.*

class Mirmillon{
    const property fuerza
    var puntosVida = 100
    var armaActual 
    var armaduraActual = escudo

    method destreza() = 15
    method estaVivo() = puntosVida > 0
    method puntosVida() = puntosVida
    method armadura() = armaduraActual
    method cambiarArmadura(unaArmadura) {armaduraActual = unaArmadura}
    method poderAtaque() = armaActual.valorAtaque() + self.fuerza()
    method poderDefensa() = armaduraActual.defensa(self) + self.destreza()
    method atacar(unGladiador){
        if(unGladiador.estaVivo() && self.puedeInflingirAtaque(unGladiador)){
            unGladiador.recibirAtaque((self.poderAtaque() - unGladiador.poderDefensa()).max(0))
        }
        
    }

    method recibirAtaque(unDaño){
        puntosVida = (puntosVida - unDaño).max(0)
    }

    method puedeInflingirAtaque(unGladiador){
        return self.poderAtaque() > unGladiador.poderDefensa()
    }

    method pelear(unGladiador){
        self.atacar(unGladiador)
        unGladiador.atacar(self)
    }

    method crearGrupo(otroGladiador){
       return new Grupo(nombre = "mirmillolandia", miembros = #{self, otroGladiador})
    }

    method curar(){
        puntosVida = 100
    }
}

class Dimachaerus{
    var puntosVida = 100
    var destreza
    const armaActual = []

    method destreza() = destreza
    method puntosVida() = puntosVida
    method fuerza() = 10
    method armadura() = 0
    method estaVivo() = puntosVida > 0
    method poderAtaque() = armaActual.sum({a => a.valorAtaque()}) + self.fuerza()
    method poderDefensa() = (self.destreza() / 2).max(0)
    method atacar(unGladiador){
        if(unGladiador.estaVivo() && self.puedeInflingirAtaque(unGladiador)){
            unGladiador.recibirAtaque((self.poderAtaque() - unGladiador.poderDefensa()).max(0))
            destreza += 1
        }
        
    }

    method recibirAtaque(unDaño){
        puntosVida = (puntosVida - unDaño).max(0)
    }

        method puedeInflingirAtaque(unGladiador){
        return self.poderAtaque() > unGladiador.poderDefensa()
    }

    method pelear(unGladiador){
        self.atacar(unGladiador)
        unGladiador.atacar(self)
    }

    method crearGrupo(otroGladiador){
       return new Grupo(nombre = "D-" + ((self.poderAtaque() + otroGladiador.poderAtaque()).toString()), miembros = #{self, otroGladiador})
    }

    method curar(){
        puntosVida = 100
    }
}
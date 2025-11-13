class ArmaDeFilo{
    const property filo
    const property longitud

    method initialize(){
        if(!filo.between(0,1)) {self.error("Filo entre 0 y 1")}
    }

    method valorAtaque() = filo * longitud

}

class ArmaContundente{
    const peso 
    method valorAtaque() = peso
}

// Armaduras

object casco {
    method defensa(unLuchador) = 10
}

object escudo {
    method defensa(unLuchador) = 5 + unLuchador.destreza()
}


object name {
    var armaduraActual = casco

    method armadura() = armaduraActual.puntosArmadura(self) 


}
class Grupo {
    const nombre
    const miembros = #{}
    var cantPeleas = 0

    method cantPeleas() = cantPeleas

    method miembros() = miembros.asSet()

    method agregarMiembro(unGladiador){
        miembros.add(unGladiador)
    }

    method quitarMiembro(unGladiador){
        miembros.remove(unGladiador)
    }

    method hayAlgunoDisponble(){
        return miembros.any({m => m.estaVivo()})
    }

    method miembrosDisponibles(){
        return miembros.filter({m => m.estaVivo()})
    }

    method campeon(){
        return self.miembrosDisponibles().max({m => m.poderAtaque()})
    }

    method pelearCon(otroGrupo){
        if(self.hayAlgunoDisponble() && otroGrupo.hayAlgunoDisponble()){
            self.campeon().pelear(otroGrupo.campeon())
        }
    }

    method registrarPelea() {cantPeleas += 1}

    method combatirCon(otroGrupo){
        (1..3).forEach({
            self.pelearCon(otroGrupo)
        })
        self.registrarPelea()
        otroGrupo.registrarPelea()
    }

    method curar(){
        miembros.forEach({m => m.curar()})
    }

/*  method combate(unGrupo){
        const campeon = self.elegirCampeon()
        const campeonEnemigo = unGrupo.elegirCampeon()
        campeon.pelear(campeonEnemigo)
        campeon.pelear(campeonEnemigo)
        campeon.pelear(campeonEnemigo) 
        self.cantPeleas() + 1
        unGrupo.cantPeleas() + 1 
    }*/
}
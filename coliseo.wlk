import grupos.*
import gladiadores.*
import armas.*


object coliseo{
    const grupos = #{}

    method combateDeGrupos(unGrupo, otroGrupo){
        unGrupo.combatirCon(otroGrupo)
    }

    method combateDesigual(unGrupo, unGladiador){
        const unGrupoSolitario = new Grupo(nombre = "solitario", miembros = #{unGladiador})
        unGrupo.combatirCon(unGrupoSolitario)
        grupos.add(unGrupoSolitario)
    }

    method curar(){
        grupos.forEach({g => g.curar()})
    }
}
/// void pokemon_reset_volatile_stat_mods(BattlePokemon);

with (argument0){
    recalculate_all_stats(id);
    
    for (var i=0; i<8; i++){
        mods[i]=0;
    }
    
    ds_list_clear(types);
    types=ds_list_clone(get_pokemon(species).types);
    
    invulnerable_state=InvulnerableStates.NONE;
    invulnerable_move=-1;
    momentum_move=-1;
    momentum_turn=1;
    trapped_by=noone;
    trapped_for=-1;
    trap_residual_damage=0;
    
    confused=0;
    flinch=false;
    
    flag_downed=false;
}

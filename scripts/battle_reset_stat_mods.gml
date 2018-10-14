/// void battle_reset_stat_mods(BattlePokemon);

with (argument0){
    for (var i=0; i<8; i++){
        mods[i]=0;
    }
    
    ds_list_clear(types);
    types=ds_list_clone(get_pokemon(species).types);
    
    flag_downed=false;
}

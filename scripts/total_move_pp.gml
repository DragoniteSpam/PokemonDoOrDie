/// int total_pp(BattlePokemon, index);

if (argument0.moves[argument1]==-1){
    return 0;
}

return argument0.move_pp[argument1]*(1+0.2*argument0.move_pp_up[argument1]);

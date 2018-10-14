/// void pokemon_teach_move(BattlePokemon, move index, slot);
// unless you want to update the previous moves list each time
// you modify the moves array, this should be the ONLY way that
// the move array is modified (not counting the pokemon_auto_moves
// script, since that sets things up slightly differently).

with (argument0){
    if (!ds_list_find_index(previous_moves, moves[argument2])==-1){
        ds_list_add(previous_moves, moves[argument2]);
    }
    moves[argument2]=argument1;
}

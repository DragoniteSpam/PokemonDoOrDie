/// list battle_get_valid_targets(user, move index);
// note: this returns a list of battlefield positions, not BattlePokemon,
// as it did originally. you want a move to target a position, not an individual,
// in the case that the individual switches out before the move lands.

// todo not all moves have the same targeting abilities but for now we assume
// that they do
if (argument1>=0){
    var move_target=get_move(argument1).target;
} else {
    var move_target=MoveTargets.ALLOPPONENTS;
}

var valid_targets=ds_list_create();
for (var i=0; i<ds_list_size(Battle.contestants); i++){
    // i don't understand why this line is here. there's no reason
    // you can't hit your teammates.
    //if (Battle.contestants[| i].owner!=argument0.owner){
    // you generally cannot, however, hit yourself.
    if (Battle.contestants[| i]!=argument0){
        ds_list_add(valid_targets, i);
    }
}

return valid_targets;

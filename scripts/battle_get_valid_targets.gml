/// list battle_get_valid_targets(user, move index);

// not all moves have the same targeting abilities but for now we assume
// that they do
var move=World.all_moves[argument1];

var valid_targets=ds_list_create();
for (var i=0; i<ds_list_size(Battle.contestants); i++){
    if (Battle.contestants[| i].owner!=argument0.owner){
        ds_list_add(valid_targets, Battle.contestants[| i]);
    }
}

return valid_targets;

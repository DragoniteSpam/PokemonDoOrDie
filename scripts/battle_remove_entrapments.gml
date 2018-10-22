/// battle_remove_entrapments(trapping position);

for (var i=0; i<ds_list_size(Battle.contestants); i++){
    var contestant=Battle.contestants[| i];
    if (contestant!=noone&&contestant.trapped_by==argument0.position){
        contestant.trapped_by=-1;
        contestant.trapped_for=0;
    }
}

/// void battle_round_action_check_contestant(params);
// 0: team index

var team=Battle.teams[| argument0[| 0]];
var found=noone;

for (var i=0; i<ds_list_size(team.owner.party); i++){
    if (alive(team.owner.party[| i])){
        found=team.owner.party[| i];
        break;
    }
}

// continue: in the message()

if (found==noone){
    message(team.name+" has no more healthy Pokémon!");
} else {
    message(team.name+" sent out "+found.name+"!");
    Battle.contestants[| argument0[| 0]]=found;
}

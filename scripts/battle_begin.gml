stage=BattleStages.BEGIN;

for (var i=0; i<ds_list_size(teams); i++){
    for (var j=0; j<ds_list_size(teams[| i].owner.party); j++){
        pokemon_reset_stat_mods(teams[| i].owner.party[| j]);
        teams[| i].owner.party[| j].owner=teams[| i].owner;
    }
}

ds_queue_enqueue(actions, battle_action_send_in_leads);

message("The battle has started!");

// control returns to the ui prompt

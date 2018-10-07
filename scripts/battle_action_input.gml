for (var i=0; i<ds_list_size(teams); i++){
    if (team_alive(Battle.teams[| i])){
        ds_queue_enqueue(round_actions, add_battle_round_action(battle_round_action_input, i));
    }
}

battle_begin_round_action();

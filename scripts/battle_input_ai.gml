/// void battle_input_ai(team, pokemon);

ds_queue_enqueue(Battle.round_actions, add_battle_round_action(battle_round_action_execute,
    add_battle_executable_action(BattleActions.MOVE, argument1, BattleTargets.OPPONENT, 0)));

battle_debug(argument0.owner.name+" has chosen their move for "+argument1.name);

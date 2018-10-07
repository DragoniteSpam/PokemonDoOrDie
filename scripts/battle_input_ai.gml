/// void battle_input_ai(team, pokemon);

battle_prioritize(add_battle_executable_action(BattleActions.MOVE, argument1, BattleTargets.OPPONENT, 0))

// continue:
battle_debug(argument0.owner.name+" has chosen their move for "+argument1.name);

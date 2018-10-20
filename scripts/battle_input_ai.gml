/// void battle_input_ai(pokemon);

var team=argument0.owner.team;

// "calculate" the move
var value=irandom(array_length_1d(argument0.moves)-1);

// calculate the target(s) (one random)
var valid_targets=battle_get_valid_targets(argument0, value);
var targets=ds_list_create();
ds_list_add(targets, random_element_from_list(valid_targets));
ds_list_destroy(valid_targets);

// put it all together

var moveid=argument0.moves[value];
battle_prioritize(add_battle_executable_action(BattleActions.MOVE, argument0, BattleTargets.OPPONENT, targets, moveid));

// continue:
battle_debug(team.owner.name+" has chosen the move "+get_move(moveid).name+" for "+argument0.name);

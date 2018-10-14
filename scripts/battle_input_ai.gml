/// void battle_input_ai(team, pokemon);

// "calculate" the move
var value=1;

// calculate the target(s) (one random)
var valid_targets=battle_get_valid_targets(argument1, value);
var targets=ds_list_create();
ds_list_add(targets, valid_targets[| irandom(ds_list_size(valid_targets)-1)]);
ds_list_destroy(valid_targets);

// put it all together

var moveid=argument1.moves[value];
battle_prioritize(add_battle_executable_action(BattleActions.MOVE, argument1, BattleTargets.OPPONENT, targets, moveid));

// continue:
battle_debug(argument0.owner.name+" has chosen the move "+get_move(moveid).name+" for "+argument1.name);

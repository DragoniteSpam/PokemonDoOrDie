/// void battle_input_ai(pokemon);

var team=argument0.owner.team;

// todo something with this eventually
var can_escape=pokemon_can_escape(argument0);

var value;
// todo if you have no PP and don't want to switch, AI should struggle
if (total_pp(argument0)>0){
    // "calculate" the move
    do {
        value=irandom(array_length_1d(argument0.moves)-1);
    } until(argument0.moves[value]!=-1&&argument0.move_pp[value]>0);
    value=argument0.moves[value];
} else {
    value=World.move_struggle;
}

// at this point value should hold a move index

// calculate the target(s) (one random)
var valid_targets=battle_get_valid_targets(argument0, value);
var targets=ds_list_create();
ds_list_add(targets, random_element_from_list(valid_targets));
ds_list_destroy(valid_targets);

// put it all together

// todo on the off chance that the ai wants to flee or switch, remember to check
// if they're being trapped by anyone. this is intended to be done when the moves
// are chosen, not when the moves are processed.
battle_prioritize(add_battle_executable_action(BattleActions.MOVE, argument0, BattleTargets.OPPONENT, targets, value));

// continue:
battle_debug(team.owner.name+" has chosen the move "+get_move(value).name+" for "+argument0.name);

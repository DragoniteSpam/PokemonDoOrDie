/// void battle_individual_action_execute_switch_before_turn(params);
// This is messy, but the alternative is adding a lot of scripts that can't
// communicate with each other to the queue in battle_round_action_check_contestant.
// I'd rather figure out the common data here and *then* set them up, even
// if it means using the queue wrong.
// (no arguments)

var replacement=Battle.misc_data[? string(Camera.battle_pawn)+" new "+string(Battle.input_processing.position)];

if (replacement!=noone){
    var act_withdraw=add_battle_individual_action(battle_individual_action_withdraw, Battle.input_processing.position);
    var act_swap=add_battle_individual_action(battle_individual_action_swap, replacement.
}

battle_advance();

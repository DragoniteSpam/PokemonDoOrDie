/// void battle_individual_action_execute_switch_before_turn(params);
// This is messy, but the alternative is adding a lot of scripts that can't
// communicate with each other to the queue in battle_round_action_check_contestant.
// I'd rather figure out the common data here and *then* set them up, even
// if it means using the queue wrong.
// (no arguments)

var replacement=Battle.replacements[| Battle.input_processing.position];
var party=Camera.battle_pawn.party;

if (replacement!=noone){
    var replacement_index=-1;
    for (var i=0; i<ds_list_size(party); i++){
        if (part[| i]==replacement){
            replacement_index=i;
            break;
        }
    }
    // This will break if replacement index isn't found. Try not to let that happen.
    var act_withdraw=add_battle_individual_action(battle_individual_action_withdraw, Battle.input_processing.position);
    var act_swap=add_battle_individual_action(battle_individual_action_swap, replacement.position, replacement_index);
}

battle_advance();

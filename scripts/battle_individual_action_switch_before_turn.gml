/// void battle_individual_action_switch_before_turn(params);
// 1: battlefield slot to fill

var params=argument0;

var result=World.message_option_result;
World.message_option_result=-1;

// This looks extremely bizarre since 0 is usually false and
// 1 is usually true, but in this case we're actually checking
// to see if the result is equal to zero.
if (result==0){
    Battle.input_stage=BattleInputStages.SWITCH_BEFORE_TURN;
    Battle.misc_data[? "contestant slot to replace"]=params[| 0];
    // This doesn't serve a purpose other than to make sure the
    // input processing code fires, since that part's skipped if
    // the input processing variable is noone;
    Battle.input_processing=Camera.battle_pawn;
    message("Who would you like to send in to replace "+Battle.contestants[| params[| 0]].name+"?");
} else {
    Battle.replacements[| params[| 0]]=noone;
    battle_advance();
}

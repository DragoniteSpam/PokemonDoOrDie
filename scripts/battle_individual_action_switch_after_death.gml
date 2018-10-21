/// void battle_individual_action_switch_after_death(params);
// 1: battlefield slot to fill

var params=argument0;

var result=World.message_option_result;
World.message_option_result=-1;

Battle.input_stage=BattleInputStages.SWITCH_BEFORE_TURN;
Battle.misc_data[? "contestant slot to replace"]=params[| 0];
Battle.misc_data[? "allowed to not send anybody in"]=false;
// This doesn't serve a purpose other than to make sure the
// input processing code fires, since that part's skipped if
// the input processing variable is noone;
Battle.input_processing=Battle.contestants[| params[| 0]];
message("Who would you like to send in to replace "+Battle.contestants[| params[| 0]].name+"?");

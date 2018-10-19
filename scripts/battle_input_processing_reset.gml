/// void battle_input_processing_reset([reset input processing?]);

var reset_input_processing=true;
switch (argument_count){
    case 1:
        reset_input_processing=argument[0];
    default:
        break;
}

// this is a little silly considering what the script is named
if (reset_input_processing){
    Battle.input_processing=noone;
}

Battle.input_stage=BattleInputStages.GRAND;
World.message_option_index=0;

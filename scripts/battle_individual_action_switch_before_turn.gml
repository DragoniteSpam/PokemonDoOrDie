/// void battle_individual_action_switch_before_turn(params);
// (no arguments)

var result=World.message_option_result;
World.message_option_result=-1;

// This looks extremely bizarre since 0 is usually false and
// 1 is usually true, but in this case we're actually checking
// to see if the result is equal to zero.
if (resuilt==0){
    var params=argument0;
    
    Battle.input_stage=BattleInputStages.SWITCH_BEFORE_TURN;
    
    // This is not a good engineering practice (assigning Pawn Player to
    // a variable that's normally intended to hold a Pokémon) but Game Maker
    // doesn't distinguish between object types well so we can get away
    // with it.
    // It's not going to be read as a Pokémon in the switch script, and
    // it's going to be reset to noone immediately after that's been dealt
    // with anyway.
    Battle.input_processing=Camera.battle_pawn;
    
    message("Who would you like to send in?");
} else {
    Battle.misc_data[? string(Camera.battle_pawn)+" new "+string(Battle.input_processing.position)]=noone;
    battle_advance();
}

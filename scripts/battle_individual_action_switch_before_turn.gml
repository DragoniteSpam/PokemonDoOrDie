/// void battle_individual_action_switch_before_turn(params);
// (no arguments)

// This looks extremely bizarre since 0 is usually false and
// 1 is usually true, but in this case we're actually checking
// to see if the result is equal to zero.
if (World.message_option_result==0){
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
    battle_advance();
}

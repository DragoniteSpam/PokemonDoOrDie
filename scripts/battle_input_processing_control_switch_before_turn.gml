/// void battle_input_processing_control_switch_before_turn();
// Of course, you could not hard-code this behavior. In fact, if you're
// trying to make a custom battle system, I suggest you do that. But in
// the meantime I'm going to hard-code this.

if (keyboard_check_released(vk_enter)){
    if (World.message_option_index==ds_list_size(Camera.battle_pawn.party)||World.message_option_index==0){
        battle_input_processing_reset();
        battle_advance();
    } else {
        // todo in multi battles when all of your front line goes down: mark
        // BattlePokemon as "selected" when you choose them here so they can't
        // be sent into both contestant slots at the same time.
        Battle.misc_data[? string(Camera.battle_pawn)+" new "+string(Battle.input_processing.position)]=World.message_option_index;
        World.message_option_result=World.message_option_index;
        // don't do this quite yet
        //battle_input_processing_reset();
        battle_advance();
    }
}

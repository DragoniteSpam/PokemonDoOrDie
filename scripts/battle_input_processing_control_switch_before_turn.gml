/// void battle_input_processing_control_switch_before_turn();
// Of course, you could not hard-code this behavior. In fact, if you're
// trying to make a custom battle system, I suggest you do that. But in
// the meantime I'm going to hard-code this.

if (keyboard_check_released(vk_enter)){
    if (World.message_option_index==ds_list_size(Camera.battle_pawn.party)){
        battle_input_processing_reset();
        battle_advance();
    } else {
        if (battle_is_on_field(Camera.battle_pawn.party[| World.message_option_index])){
            message(Camera.battle_pawn.party[| World.message_option_index].name+" is already fighting!");
        } else {
            // todo in multi battles when all of your front line goes down: mark
            // BattlePokemon as "selected" when you choose them here so they can't
            // be sent into both contestant slots at the same time.
            Battle.replacements[| Battle.misc_data[? "contestant slot to replace"]]=World.message_option_index;
            World.message_option_result=World.message_option_index;
            Battle.input_stage=BattleInputStages.GRAND;
            Battle.input_processing=noone;
            // don't do this quite yet
            //battle_input_processing_reset();
            battle_advance();
        }
    }
}

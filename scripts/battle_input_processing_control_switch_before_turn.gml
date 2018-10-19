/// void battle_input_processing_control_switch_before_turn();
// Of course, you could not hard-code this behavior. In fact, if you're
// trying to make a custom battle system, I suggest you do that. But in
// the meantime I'm going to hard-code this.

if (keyboard_check_released(vk_enter)){
    // This value should be set whenever the input stage is set to this.
    // Yes, I gave it that ridiculously long name to be funny.
    var opt_out=Battle.misc_data[? "allowed to not send anybody in"];
    
    if (World.message_option_index==ds_list_size(Camera.battle_pawn.party)){
        if (opt_out){
            battle_input_processing_reset();
            battle_advance();
        } else {
            message("You need to select somebody to send in!");
        }
    } else {
        var target=Camera.battle_pawn.party[| World.message_option_index];
        
        if (!alive(target)){
            message(target.name+" is unable to fight!");
        } else if (battle_is_on_field(target)){
            message(target.name+" is already fighting!");
        } else {
            // todo in multi battles when all of your front line goes down: mark
            // BattlePokemon as "selected" when you choose them here so they can't
            // be sent into both contestant slots at the same time.
            Battle.replacements[| Battle.misc_data[? "contestant slot to replace"]]=World.message_option_index;
            World.message_option_result=World.message_option_index;
            battle_input_processing_reset();
            battle_advance();
        }
    }
}

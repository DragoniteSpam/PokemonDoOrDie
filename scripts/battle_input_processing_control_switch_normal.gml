/// void battle_input_processing_control_switch_normal();
// see comments in battle_input_processing_control_switch_before_turn

if (keyboard_check_released(vk_enter)){
    var target=Camera.battle_pawn.party[| World.message_option_index];
    
    if (World.message_option_index==ds_list_size(Camera.battle_pawn.party)){
        battle_input_processing_reset(false);
    } else if (battle_is_on_field(target)){
        message(target.name+" is already in battle!");
    } else if (!alive(target)){
        message(target.name+" is unable to fight!");
    } else {
        var index=World.message_option_index;
        var pkmn=Battle.input_processing;
        battle_prioritize(add_battle_executable_action(BattleActions.SWITCH, pkmn, BattleTargets.SELF, noone, target));
        battle_input_processing_reset();
        
        battle_debug(pkmn.owner.name+" has chosen to switch to "+target.name+".");
    }
}

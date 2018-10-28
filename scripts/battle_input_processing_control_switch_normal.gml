/// void battle_input_processing_control_switch_normal();
// see comments in battle_input_processing_control_switch_before_turn

if (keyboard_check_released(vk_enter)){
    var target=Battle.input_processing.owner.party[| World.message_option_index];
    
    if (World.message_option_index==ds_list_size(Camera.battle_pawn.party)){
        battle_input_processing_reset(false);
    } else if (battle_is_on_field(target)){
        message(L('%0 is already in battle!', target.name));
    } else if (!alive(target)){
        message(L('%0 is unable to fight!', target.name));
    } else {
        var index=World.message_option_index;
        var pkmn=Battle.input_processing;
        battle_prioritize(add_battle_executable_action(BattleActions.SWITCH, pkmn, BattleTargets.SELF, noone, World.message_option_index));
        battle_input_processing_reset();
        
        battle_debug(pkmn.owner.name+' has chosen to switch to '+target.name+'.');
    }
}

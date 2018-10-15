/// void battle_input_processing_control_switch_normal();
// see comments in battle_input_processing_control_switch_before_turn

if (keyboard_check_released(vk_enter)){
    if (World.message_option_index==ds_list_size(Camera.battle_pawn.party)){
        Battle.input_stage=BattleInputStages.GRAND;
        World.message_option_index=0;
    } else if (World.message_option_index==0){
        message(Battle.input_processing.name+" is already in battle!");
    } else {
        var index=World.message_option_index;
        var pkmn=Battle.input_processing;
        battle_prioritize(add_battle_executable_action(BattleActions.SWITCH, pkmn, BattleTargets.SELF, noone, Camera.battle_pawn.party[| index]));
        battle_input_processing_reset();
        
        battle_debug(pkmn.owner.name+" has chosen to switch to "+Camera.battle_pawn.party[| index].name+".");
    }
}

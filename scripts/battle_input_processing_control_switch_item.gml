/// void battle_input_processing_control_switch_item();

if (keyboard_check_released(vk_enter)){
    if (World.message_option_index==ds_list_size(Camera.battle_pawn.party)){
        battle_input_processing_reset(BattleInputStages.ITEM_INTERNAL);
        battle_advance();
    } else {
        var pkmn=Battle.input_processing.owner.party[| World.message_option_index];
        var item=Battle.misc_data[? "item to use"];
        
        var output=script_execute(get_item(item).battle_use_from_bag, pkmn, item);
        
        if (output!=noone){
            battle_prioritize(output);
            battle_input_processing_reset();
            battle_debug(pkmn.owner.name+" has chosen to use a(n) "+get_item(item).name);
        }
    }
}

var text_list=ds_list_create();
ds_list_add(text_list, "Fight!", "Item", "Switch", "Flee");

if (DEBUG){
    ds_list_add(text_list, "[Idle]");
}

var max_n=ds_list_size(text_list);

draw_menu_from_list(text_list, Battle.input_index);
Battle.input_index=menu_input(Battle.input_index, max_n);

if (keyboard_check_released(vk_enter)){
    switch (Battle.input_index){
        case 0:
            Battle.input_stage=BattleInputStages.MOVE;
            break;
        case 1:
//            Battle.input_stage=BattleInputStages.ITEM;
            break;
        case 2:
//            Battle.input_stage=BattleInputStages.SWITCH;
            break;
        case 3:
//            Battle.input_stage=BattleInputStages.FLEE;
            break;
        case 4:
            battle_prioritize(add_battle_executable_action(BattleActions.IDLE, pkmn, BattleTargets.SELF, noone, 0));
            battle_input_processing_reset();
            battle_debug(pkmn.owner.name+" has chosen to idle for "+pkmn.name);
            break;
    }
}

ds_list_destroy(text_list);

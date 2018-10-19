var text_list=ds_list_create();
ds_list_add(text_list, "Fight!", "Item", "Switch", "Flee");

if (DEBUG||World.settings.battle.idle_allowed){
    ds_list_add(text_list, "Idle");
}
if (DEBUG){
    ds_list_add(text_list, "[Auto-KO]");
    ds_list_add(text_list, "[Auto-Victory]");
}

var max_n=ds_list_size(text_list);

draw_menu_from_list(text_list, World.message_option_index);
World.message_option_index=menu_input(World.message_option_index, max_n);

if (keyboard_check_released(vk_enter)){
    switch (World.message_option_index){
        case 0:
            Battle.input_stage=BattleInputStages.MOVE;
            break;
        case 1:
//            Battle.input_stage=BattleInputStages.ITEM;
            break;
        case 2:
            Battle.input_stage=BattleInputStages.SWITCH;
            break;
        case 3:
//            Battle.input_stage=BattleInputStages.FLEE;
            break;
        // because we sort of know the order in which these options will appear
        // (if Idle exists it WILL be fourth, and if the debug options exist
        // we know Idle also has to) we can cheat with these case statements a
        // little.
        // in general you would probably want to have a way to make sure you
        // selected what you think you selected, though.
        case 4:
            var pkmn=Battle.input_processing;
            battle_prioritize(add_battle_executable_action(BattleActions.IDLE, pkmn, BattleTargets.SELF, noone, 0));
            battle_input_processing_reset();
            battle_debug(pkmn.owner.name+" has chosen to idle for "+pkmn.name);
            break;
        case 5:
            var pkmn=Battle.input_processing;
            battle_prioritize(add_battle_executable_action(BattleActions.AUTOKO, pkmn, BattleTargets.SELF, battle_get_valid_targets(pkmn, -1), 0));
            battle_input_processing_reset();
            battle_debug(pkmn.owner.name+" has chosen to auto-KO all foes with "+pkmn.name);
            break;
        case 6:
            var pkmn=Battle.input_processing;
            battle_prioritize(add_battle_executable_action(BattleActions.AUTOVICTORY, pkmn, BattleTargets.SELF, battle_get_valid_targets(pkmn, -1), 0));
            battle_input_processing_reset();
            battle_debug(pkmn.owner.name+" has chosen to end the battle with "+pkmn.name);
            break;
    }
}

ds_list_destroy(text_list);

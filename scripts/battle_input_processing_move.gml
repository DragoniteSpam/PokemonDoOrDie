var pkmn=Battle.input_processing;

var text_list=ds_list_create();
// this is silly but we need a list of text for the "max width" script
var move_list=ds_list_create();

for (var i=0; i<array_length_1d(pkmn.moves); i++){
    if (pkmn.moves[i]==noone){
        ds_list_add(text_list, "---");
        ds_list_add(move_list, noone);
    } else {
        ds_list_add(text_list, get_move(pkmn.moves[i]).name);
        ds_list_add(move_list, pkmn.moves[i]);
    }
}

if (false){
    // todo: move pp
    battle_debug(pkmn.name+" has no valid moves, struggling");
} else {
    var max_n=ds_list_size(text_list);
    
    draw_menu_from_list(text_list, Battle.input_index);    
    Battle.input_index=menu_input(Battle.input_index, max_n);
    
    if (keyboard_check_released(vk_enter)){
        if (move_list[| Battle.input_index]==noone){
            // to do play some kind of silly "invalid" sound
        } else {
            var value=move_list[| Battle.input_index];
            // at some point in the future this needs to be moved to a different script that can
            // account for selecting multiple valid targets
            var valid_targets=battle_get_valid_targets(pkmn, value);
            var targets=ds_list_create();
            ds_list_add(targets, valid_targets[| irandom(ds_list_size(valid_targets)-1)]);
            ds_list_destroy(valid_targets);
            
            battle_prioritize(add_battle_executable_action(BattleActions.MOVE, pkmn, BattleTargets.OPPONENT, targets, value));
            
            battle_input_processing_reset();
            
            battle_debug(pkmn.owner.name+" has chosen the move "+text_list[| Battle.input_index]+" for "+pkmn.name);
        }
    }
}

ds_list_destroy(text_list);
ds_list_destroy(move_list);

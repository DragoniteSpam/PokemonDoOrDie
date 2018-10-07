var pkmn=Battle.input_processing;

var text_list=ds_list_create();
// this is silly but we need a list of text for the "max width" script
var move_list=ds_list_create();

for (var i=0; i<array_length_1d(pkmn.moves); i++){
    if (pkmn.moves[i]==noone){
        ds_list_add(text_list, "---");
        ds_list_add(move_list, noone);
    } else {
        ds_list_add(text_list, World.all_moves[text_list[| i]].name);
        ds_list_add(move_list, pkmn.moves[i]);
    }
}

if (false){
    // to do: move pp
    battle_debug(pkmn.name+" has no valid moves, struggling");
} else {
    var max_n=ds_list_size(text_list);
    var max_width=ds_list_max_width(text_list);
    
    var box_width=max_width+2*UI_TEXT_BOX_OFFSET_W+UI_TEXT_BOX_BUFFER;
    var box_height=UI_TEXT_OPTION_HEIGHT*max_n+2*UI_TEXT_BOX_OFFSET_H;
    var box_x=room_width-box_width;
    var box_y=room_height-box_height;
    
    var text_spacing=font_get_size(FPokemonMedium);
    
    draw_rectangle_9s(spr_window9s_hgss, box_x, box_y, box_width, box_height);
    
    draw_set_valign(fa_middle);
    
    for (var i=0; i<max_n; i++){
        draw_text(box_x+UI_TEXT_BOX_BUFFER+UI_TEXT_BOX_OFFSET_W, box_y+UI_TEXT_BOX_OFFSET_H+text_spacing/2+UI_TEXT_OPTION_HEIGHT*i, text_list[| i]);
    }
    
    draw_selection_arrow(box_x+UI_TEXT_BOX_OFFSET_W/*+UI_TEXT_BOX_BUFFER/2*/, box_y+UI_TEXT_BOX_OFFSET_H+text_spacing/2+UI_TEXT_OPTION_HEIGHT*Battle.input_index);
    
    if (keyboard_check_released(vk_up)||keyboard_check_released(ord('W'))){
        Battle.input_index=max(0, --Battle.input_index);
    }
    if (keyboard_check_released(vk_down)||keyboard_check_released(ord('S'))){
        Battle.input_index=min(max_n-1, ++Battle.input_index);
    }
    if (keyboard_check_released(vk_left)||keyboard_check_released(ord('A'))){
        Battle.input_index=0;
    }
    if (keyboard_check_released(vk_right)||keyboard_check_released(ord('D'))){
        Battle.input_index=max_n-1;
    }
    if (keyboard_check_released(vk_enter)){
        if (text_list[| Battle.input_index]==noone){
            // to do play some kind of silly "invalid" sound
        } else {
            ds_queue_enqueue(Battle.round_actions, add_battle_round_action(battle_round_action_execute,
                add_battle_executable_action(BattleActions.MOVE, pkmn, BattleTargets.OPPONENT, move_list[| Battle.input_index])));
            
            battle_debug("player has chosen the move "+text_list[| Battle.input_index]+" for "+pkmn);
        }
    }
}

ds_list_destroy(text_list);
ds_list_destroy(move_list);

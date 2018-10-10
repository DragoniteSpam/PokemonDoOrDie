var pkmn=Battle.misc_data[? "who"];
var old_level=Battle.misc_data[? "old level"];
var new_level=Battle.misc_data[? "new level"];

var max_n=7;

var box_width=UI_BATTLE_HUD_WIDTH;
var box_height=UI_TEXT_OPTION_HEIGHT*max_n+2*UI_TEXT_BOX_OFFSET_H;
var box_x=room_width-box_width;
var box_y=room_height-box_height;

var text_spacing=font_get_size(FPokemonMedium);

draw_rectangle_9s(spr_window9s_hgss, box_x, box_y, box_width, box_height);

draw_set_valign(fa_middle);

draw_text(box_x+UI_TEXT_BOX_BUFFER+UI_TEXT_BOX_OFFSET_W, box_y+UI_TEXT_BOX_OFFSET_H+text_spacing/2+UI_TEXT_OPTION_HEIGHT*i, pkmn.name);
draw_text(box_x+UI_TEXT_BOX_BUFFER+UI_TEXT_BOX_OFFSET_W, box_y+UI_TEXT_BOX_OFFSET_H+text_spacing/2+UI_TEXT_OPTION_HEIGHT, delta_hp);

finish this please

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
        
        battle_debug("player has chosen the move "+text_list[| Battle.input_index]+" for "+pkmn.name);
    }
}

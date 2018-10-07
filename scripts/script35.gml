var text_list=ds_list_create();
ds_list_add(text_list, "Fight!", "Item", "Switch", "Flee");

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
    }
}

ds_list_destroy(text_list);

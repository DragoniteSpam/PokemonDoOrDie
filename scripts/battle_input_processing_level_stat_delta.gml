var pkmn=Battle.misc_data[? "who"];

var max_n=7;

var box_width=UI_BATTLE_HUD_WIDTH;
var box_height=UI_TEXT_OPTION_HEIGHT*max_n+2*UI_TEXT_BOX_OFFSET_H;
var box_x=room_width-box_width;
var box_y=room_height-box_height;

var text_spacing=font_get_size(FPokemonMedium);

draw_rectangle_9s(spr_window9s_hgss, box_x, box_y, box_width, box_height);

draw_set_valign(fa_middle);

var delta_hp=Battle.misc_data[? "new hp"]-Battle.misc_data[? "old hp"];
var delta_atk=Battle.misc_data[? "new atk"]-Battle.misc_data[? "old atk"];
var delta_def=Battle.misc_data[? "new def"]-Battle.misc_data[? "old def"];
var delta_spa=Battle.misc_data[? "new spa"]-Battle.misc_data[? "old spa"];
var delta_spd=Battle.misc_data[? "new spd"]-Battle.misc_data[? "old spd"];
var delta_spe=Battle.misc_data[? "new spe"]-Battle.misc_data[? "old spe"];

draw_text(box_x+UI_TEXT_BOX_BUFFER+UI_TEXT_BOX_OFFSET_W, box_y+UI_TEXT_BOX_OFFSET_H+text_spacing/2/*+UI_TEXT_OPTION_HEIGHT*i*/, pkmn.name);
draw_text(box_x+UI_TEXT_BOX_BUFFER+UI_TEXT_BOX_OFFSET_W, box_y+UI_TEXT_BOX_OFFSET_H+text_spacing/2+UI_TEXT_OPTION_HEIGHT, "+"+string(delta_hp));
draw_text(box_x+UI_TEXT_BOX_BUFFER+UI_TEXT_BOX_OFFSET_W, box_y+UI_TEXT_BOX_OFFSET_H+text_spacing/2+UI_TEXT_OPTION_HEIGHT*2, "+"+string(delta_atk));
draw_text(box_x+UI_TEXT_BOX_BUFFER+UI_TEXT_BOX_OFFSET_W, box_y+UI_TEXT_BOX_OFFSET_H+text_spacing/2+UI_TEXT_OPTION_HEIGHT*3, "+"+string(delta_def));
draw_text(box_x+UI_TEXT_BOX_BUFFER+UI_TEXT_BOX_OFFSET_W, box_y+UI_TEXT_BOX_OFFSET_H+text_spacing/2+UI_TEXT_OPTION_HEIGHT*4, "+"+string(delta_spa));
draw_text(box_x+UI_TEXT_BOX_BUFFER+UI_TEXT_BOX_OFFSET_W, box_y+UI_TEXT_BOX_OFFSET_H+text_spacing/2+UI_TEXT_OPTION_HEIGHT*5, "+"+string(delta_spd));
draw_text(box_x+UI_TEXT_BOX_BUFFER+UI_TEXT_BOX_OFFSET_W, box_y+UI_TEXT_BOX_OFFSET_H+text_spacing/2+UI_TEXT_OPTION_HEIGHT*6, "+"+string(delta_spe));

draw_selection_arrow(box_x+UI_TEXT_BOX_OFFSET_W/*+UI_TEXT_BOX_BUFFER/2*/, box_y+UI_TEXT_BOX_OFFSET_H+text_spacing/2+UI_TEXT_OPTION_HEIGHT*Battle.input_index);

if (keyboard_check_released(vk_enter)){
    battle_debug("player has viewed the level stat delta screen for "+pkmn.name);
}

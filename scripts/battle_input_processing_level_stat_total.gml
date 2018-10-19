var pkmn=Battle.misc_data[? "who"];
var old_level=Battle.misc_data[? "old level"];
var new_level=Battle.misc_data[? "new level"];

var max_n=7;

var text_spacing=font_get_size(FPokemonMedium)*1.5;

var box_width=UI_BATTLE_HUD_WIDTH;
var box_height=text_spacing*(max_n+2);
var box_x=room_width-box_width;
var box_y=room_height-box_height;

draw_rectangle_9s(spr_window9s_hgss, box_x, box_y, box_width, box_height);

draw_set_valign(fa_middle);

draw_text(box_x+text_spacing+UI_TEXT_BOX_OFFSET_W, box_y+1.5*text_spacing, pkmn.name+": +"+
    string(Battle.misc_data[? "new level"]-Battle.misc_data[? "old level"]));
draw_text(box_x+text_spacing+UI_TEXT_BOX_OFFSET_W, box_y+1.5*text_spacing+text_spacing, string(Battle.misc_data[? "new hp"])+" HP");
draw_text(box_x+text_spacing+UI_TEXT_BOX_OFFSET_W, box_y+1.5*text_spacing+text_spacing*2, string(Battle.misc_data[? "new atk"])+" Attack");
draw_text(box_x+text_spacing+UI_TEXT_BOX_OFFSET_W, box_y+1.5*text_spacing+text_spacing*3, string(Battle.misc_data[? "new def"])+" Defense");
draw_text(box_x+text_spacing+UI_TEXT_BOX_OFFSET_W, box_y+1.5*text_spacing+text_spacing*4, string(Battle.misc_data[? "new spa"])+" Sp. Attack");
draw_text(box_x+text_spacing+UI_TEXT_BOX_OFFSET_W, box_y+1.5*text_spacing+text_spacing*5, string(Battle.misc_data[? "new spd"])+" Sp. Defense");
draw_text(box_x+text_spacing+UI_TEXT_BOX_OFFSET_W, box_y+1.5*text_spacing+text_spacing*6, string(Battle.misc_data[? "new spe"])+" Speed");

if (keyboard_check_released(vk_enter)||keyboard_check_released(vk_escape)){
    battle_input_processing_reset();
    battle_debug(pkmn.owner.name+" has viewed the stat/level screen for "+pkmn.name);
}

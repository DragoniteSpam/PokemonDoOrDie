var pkmn=Battle.misc_data[? "who"];

var max_n=7;

var text_spacing=font_get_size(FPokemonMedium)*1.5;

var box_width=UI_BATTLE_HUD_WIDTH;
var box_height=text_spacing*(max_n+2);
var box_x=room_width-box_width;
var box_y=room_height-box_height;

draw_rectangle_9s(spr_window9s_hgss, box_x, box_y, box_width, box_height);

draw_set_valign(fa_middle);

var delta_hp=Battle.misc_data[? "new hp"]-Battle.misc_data[? "old hp"];
var delta_atk=Battle.misc_data[? "new atk"]-Battle.misc_data[? "old atk"];
var delta_def=Battle.misc_data[? "new def"]-Battle.misc_data[? "old def"];
var delta_spa=Battle.misc_data[? "new spa"]-Battle.misc_data[? "old spa"];
var delta_spd=Battle.misc_data[? "new spd"]-Battle.misc_data[? "old spd"];
var delta_spe=Battle.misc_data[? "new spe"]-Battle.misc_data[? "old spe"];

draw_text(box_x+text_spacing+UI_TEXT_BOX_OFFSET_W, box_y+1.5*text_spacing, pkmn.name+": +"+
    string(Battle.misc_data[? "new level"]-Battle.misc_data[? "old level"]));
draw_text(box_x+text_spacing+UI_TEXT_BOX_OFFSET_W, box_y+1.5*text_spacing+text_spacing, "+"+string(delta_hp)+" HP");
draw_text(box_x+text_spacing+UI_TEXT_BOX_OFFSET_W, box_y+1.5*text_spacing+text_spacing*2, "+"+string(delta_atk)+" Attack");
draw_text(box_x+text_spacing+UI_TEXT_BOX_OFFSET_W, box_y+1.5*text_spacing+text_spacing*3, "+"+string(delta_def)+" Defense");
draw_text(box_x+text_spacing+UI_TEXT_BOX_OFFSET_W, box_y+1.5*text_spacing+text_spacing*4, "+"+string(delta_spa)+" Sp. Attack");
draw_text(box_x+text_spacing+UI_TEXT_BOX_OFFSET_W, box_y+1.5*text_spacing+text_spacing*5, "+"+string(delta_spd)+" Sp. Defense");
draw_text(box_x+text_spacing+UI_TEXT_BOX_OFFSET_W, box_y+1.5*text_spacing+text_spacing*6, "+"+string(delta_spe)+" Speed");

if (keyboard_check_released(vk_enter)||keyboard_check_released(vk_escape)){
    Battle.input_stage=BattleInputStages.LEVEL_STAT_TOTAL;
}

/// void script_draw_text(DataEventNode, Entity);

var node=argument0;
var entity=argument1;

var text_box_start_x=0;
var text_box_start_y=H-UI_TEXT_BOX_HEIGHT;

draw_rectangle_9s(spr_window9s_hgss, text_box_start_x, text_box_start_y, UI_TEXT_BOX_WIDTH, UI_TEXT_BOX_HEIGHT);

draw_set_font(FPokemonMedium);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);

var message_length=string_length(message_text);
var option_max_n=ds_list_size(message_options);

draw_text_ext(text_box_start_x+UI_TEXT_BOX_OFFSET_W, text_box_start_y+UI_TEXT_BOX_OFFSET_H, string_copy(message_text, 1, message_text_t), -1, UI_TEXT_WIDTH);

message_text_t=min(message_length, ++message_text_t);

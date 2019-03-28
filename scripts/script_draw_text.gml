/// void script_draw_text(DataEventNode, Entity);

var node=argument0;
var entity=argument1;

var text_box_start_x=0;
var text_box_start_y=H-UI_TEXT_BOX_HEIGHT;

draw_rectangle_9s(spr_window9s_hgss, text_box_start_x, text_box_start_y, UI_TEXT_BOX_WIDTH, UI_TEXT_BOX_HEIGHT);
scribble_draw(scribble_text, text_box_start_x+UI_TEXT_BOX_OFFSET_W, text_box_start_y+UI_TEXT_BOX_OFFSET_H);

scribble_step(scribble_text);

if (get_release_a()){
    var state=scribble_typewriter_get_state(scribble_text);
    if (state==1){
        cutscene_proceed();
    } else if (state>0.25){
        scribble_typewriter_in(scribble_text, SCRIBBLE_TYPEWRITER_WHOLE);
    }
}

//var _box=scribble_get_box(text, x, y, 5, 5, 5, 5 );
//draw_rectangle(_box[E_SCRIBBLE_BOX.X0], _box[E_SCRIBBLE_BOX.Y0], _box[E_SCRIBBLE_BOX.X3], _box[E_SCRIBBLE_BOX.Y3], true);

/*
draw_set_font(FGameMedium);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);

var message_length=string_length(message_text);
var option_max_n=ds_list_size(message_options);

draw_text_ext(text_box_start_x+UI_TEXT_BOX_OFFSET_W, text_box_start_y+UI_TEXT_BOX_OFFSET_H, string_copy(message_text, 1, message_text_t), -1, UI_TEXT_WIDTH);

if (get_release_a()){
    if (message_text_t>=message_length){
        cutscene_proceed();
    } else {
        message_text_t=message_length;
    }
}

message_text_t=min(message_length, ++message_text_t);*/

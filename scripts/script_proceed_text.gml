/// void script_proceed_text(DataEventNode, Entity);

scribble_destroy(scribble_text);

if (++event_node_index==ds_list_size(argument0.data)){
    cutscene_begin(argument0.outbound[| 0], argument1);
} else {
    message_text=argument0.data[| event_node_index];
    message_text_t=0;
    
    scribble_text=scribble_create(message_text, undefined, UI_TEXT_BOX_WIDTH-2*UI_TEXT_BOX_OFFSET_W, c_black);
    scribble_typewriter_in(scribble_text, SCRIBBLE_TYPEWRITER_PER_CHARACTER, World.settings.gameplay.text_speed, World.settings.gameplay.text_smoothness);
    scribble_set_box_alignment(scribble_text, fa_left, fa_top);
}

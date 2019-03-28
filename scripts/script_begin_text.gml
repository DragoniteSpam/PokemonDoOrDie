/// void script_begin_text(DataEventNode, Entity);

message_text=argument0.data[| 0];
message_text_t=0;
message_wait=0;
ds_list_clear(message_options);
ds_list_clear(message_option_ids);

event_node_index=0;

scribble_text=scribble_create(message_text, undefined, undefined, c_black);
scribble_typewriter_in(scribble_text, SCRIBBLE_TYPEWRITER_PER_CHARACTER, World.settings.gameplay.text_speed, World.settings.gameplay.text_smoothness);
scribble_set_box_alignment(scribble_text, fa_left, fa_top);

/// void script_begin_text(DataEventNode, Entity);

message_text=argument0.data[| 0];
message_text_t=0;
message_wait=0;
ds_list_clear(message_options);
ds_list_clear(message_option_ids);

event_node_index=0;

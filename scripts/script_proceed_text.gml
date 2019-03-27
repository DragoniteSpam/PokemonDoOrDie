/// void script_proceed_text(DataEventNode, Entity);

if (++event_node_index==ds_list_size(argument0.data)){
    cutscene_begin(argument0.outbound[| 0], argument1);
} else {
    message_text=argument0.data[| 0];
    message_text_t=0;
}

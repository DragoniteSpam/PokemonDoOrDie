/// void load_events(buffer, version);
// this is dummied out for now. i'm still undecided about how i want to store these internally.
// see the editor code to see exactly what each of these values does in there.

var version=argument1;
var n_events=buffer_read(argument0, buffer_u32);

repeat(n_events){
    var event_name=buffer_read(argument0, buffer_string);
    var n_nodes=buffer_read(argument0, buffer_u32);
    repeat(n_nodes){
        var node_name=buffer_read(argument0, buffer_string);
        var node_type=buffer_read(argument0, buffer_u16);
        var node_x=buffer_read(argument0, buffer_u32);
        var node_y=buffer_read(argument0, buffer_u32);
        var n_outbound=buffer_read(argument0, buffer_u8);
        repeat(n_outbound){
            buffer_read(argument0, buffer_string);
            buffer_read(argument0, buffer_string);
        }
    }
}

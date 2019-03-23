/// void load_map_contents_dynamic(buffer, version);

var version=argument1;

var n_things=buffer_read(argument0, buffer_u32);

repeat(n_things){
    var type=buffer_read(argument0, buffer_u16);
    var thing=instance_create(0, 0, World.etype_objects[type]);
    script_execute(thing.load_script, argument0, thing);
    
    //map_add_dynamic(get_active_map(), thing, thing.xx, thing.yy, thing.zz);
    map_add_static(get_active_map(), thing, thing.xx, thing.yy, thing.zz);
}

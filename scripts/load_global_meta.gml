/// void load_global_meta(buffer, version);

var version=argument1;

var n_maps=buffer_read(argument0, buffer_u16);
World.all_maps=array_create(n_maps);

for (var i=0; i<n_maps; i++){
    World.all_maps[i]=buffer_read(argument0, buffer_string);
}

if (version>=DataVersions.VRAX_REFERENCE){
    var filename=buffer_read(argument0, buffer_string);
    // if one already exists bad things will happen but that won't happen
    // unless i do something wrong or you screw with the editor
    World.all_mesh_map=const_mesh_load_vrax(filename);
}

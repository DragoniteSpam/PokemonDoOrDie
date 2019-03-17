/// void load_global_map_meta(buffer, version);

var version=argument1;

var n_maps=buffer_read(argument0, buffer_u16);
World.all_maps=array_create(n_maps);

for (var i=0; i<n_maps; i++){
    World.all_maps[i]=buffer_read(argument0, buffer_string);
}

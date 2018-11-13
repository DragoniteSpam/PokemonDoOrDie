/// VRAContainer const_mesh_load_vrax(filename);

var map=ds_map_create();
var buffer=buffer_load(argument[0]);
var n=buffer_read(buffer, T);

repeat(n){
    var model_name=buffer_read_string(buffer);
    map[? model_name]=const_mesh_next(buffer);
}

buffer_delete(buffer);

return map;

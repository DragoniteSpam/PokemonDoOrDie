/// void load_data_instance_blob(buffer, version, map, type array);

var version=argument1;

for (var i=0; i<array_length_1d(argument3); i++){
    var property=argument3[i];
    
    argument2[? property[0]]=buffer_read(argument0, property[2]);
}

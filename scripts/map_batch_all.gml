/// void map_batch_all(DataMap);

var map=argument0;

vertex_begin(map.statics, World.vertex_format);

for (var i=0; i<ds_list_size(map.list_static); i++){
    var thing=map.list_static[| i];
    // batch scripts should all take the parameters
    // (vertex buffer, Entity, x, y, z)
    script_execute(thing.batch, map.statics, thing, thing.xx, thing.yy, thing.zz);
}

vertex_end(map.statics);
vertex_freeze(map.statics);

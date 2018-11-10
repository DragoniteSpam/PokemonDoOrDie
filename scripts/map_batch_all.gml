/// void map_batch_all(DataMap);

var map=argument0;

vertex_begin(map.statics, World.vertex_format);

for (var i=0; i<map.xx; i++){
    for (var j=0; j<map.yy; j++){
        var array=map.contents_static[# i, j];
        for (var k=0; k<map.zz; k++){
            if (array[k]!=noone){
                // batch scripts should all take the parameters
                // (vertex buffer, owner Entity, x, y, z)
                script_execute(array[k].batch, map.statics, array[k], i, j, k);
            }
        }
    }
}

vertex_end(map.statics);
vertex_freeze(map.statics);

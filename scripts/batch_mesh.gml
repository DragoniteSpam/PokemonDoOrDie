/// void batch_mesh(vertex buffer, EntityTile, xx, yy, zz);

var buffer=argument0;
var mesh=argument1;

var xx=argument2*TILE_WIDTH;
var yy=argument3*TILE_HEIGHT;
var zz=argument4*TILE_DEPTH;

var data=mesh.mesh_data[MeshArrayData.DATA];
buffer_seek(data, buffer_seek_start, 0);

while (buffer_tell(data)<buffer_get_size(data)){
    vertex_point_complete(buffer, xx+buffer_read(data, buffer_f32),
        yy+buffer_read(data, buffer_f32),
        zz+buffer_read(data, buffer_f32),
        buffer_read(data, buffer_f32),
        buffer_read(data, buffer_f32),
        buffer_read(data, buffer_f32),
        buffer_read(data, buffer_f32), buffer_read(data, buffer_f32),
        c_white, 255);
        debug("color: "+string(buffer_read(data, buffer_f32)))
        debug("alpha: "+string(buffer_read(data, buffer_f32)))
        this is not working but it should be
}

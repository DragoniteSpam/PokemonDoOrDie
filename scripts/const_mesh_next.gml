/// array const_mesh_next(buffer, grid size);
// the array that is returned takes the form of
// [vbuff, xmin, ymin, zmin, xmax, ymax, zmax]

var n=buffer_read(argument0, T);

var buffer=vertex_create_buffer();
vertex_begin(buffer, World.vertex_format);

repeat(n){
    var xx=buffer_read(argument0, T);
    var yy=buffer_read(argument0, T);
    var zz=buffer_read(argument0, T);
    var nx=buffer_read(argument0, T);
    var ny=buffer_read(argument0, T);
    var nz=buffer_read(argument0, T);
    var xtex=buffer_read(argument0, T);
    var ytex=buffer_read(argument0, T);
    var color=buffer_read(argument0, T);
    var alpha=buffer_read(argument0, T);
    
    vertex_position_3d(buffer, xx, yy, zz);
    vertex_normal(buffer, nx, ny, nz);
    vertex_texcoord(buffer, xtex, ytex);
    vertex_colour(buffer, color, alpha);
}

var xmin=0;
var ymin=0;
var zmin=0;
var xmax=0;
var ymax=0;
var zmax=0;

if (argument1>0){
    xmin=buffer_read(argument0, T);
    ymin=buffer_read(argument0, T);
    zmin=buffer_read(argument0, T);
    xmax=buffer_read(argument0, T);
    ymax=buffer_read(argument0, T);
    zmax=buffer_read(argument0, T);
}

vertex_end(buffer);
vertex_freeze(buffer);

return array_compose(buffer, xmin, ymin, zmin, xmax, ymax, zmax);

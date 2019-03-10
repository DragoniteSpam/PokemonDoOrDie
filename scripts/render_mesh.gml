/// void render_mesh(EntityMesh, xx, yy, zz);

var mesh=argument0;
var xx=argument1;
var yy=argument2;
var zz=argument3;

var map=get_active_map();

transform_set(xx*TILE_WIDTH, yy*TILE_HEIGHT, zz*TILE_DEPTH, 0, 0, 0, 1, 1, 1);

vertex_submit(mesh.mesh_data[MeshArrayData.VBUFF], pr_trianglelist, map.texture);

transform_reset();

/// void render_mesh(EntityMesh, xx, yy, zz);

var mesh=argument0;
var xx=argument1;
var yy=argument2;
var zz=argument3;

transform_set(xx*TILE_WIDTH, yy*TILE_HEIGHT, zz*TILE_DEPTH, 0, 0, 0, 1, 1, 1);

vertex_submit(mesh.mesh_data[MeshArrayData.VBUFF], pr_trianglelist, sprite_get_texture(b_tileset_overworld, 0));

transform_reset();

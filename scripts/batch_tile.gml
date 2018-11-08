/// void batch_tile(vertex buffer, EntityTile, x, y, z);

var buffer=argument0;
var tile=argument1;

var xx=argument2*TILE_WIDTH;
var yy=argument3*TILE_HEIGHT;
var zz=argument4*TILE_DEPTH;
// todo correct normal calculation, and MAYBE normal smoothing, although
// i'm pretty sure that's going to be really expensive unless you bake it
// into the likely future map editing tool
var nx=0;
var ny=0;
var nz=1;

// subject to change, and assuming each is square, which they don't have
// to be
var tile_size=32;

var tile_horizontal_count=sprite_get_width(tile.tileset)/tile_size;
var tile_vertical_count=sprite_get_height(tile.tileset)/tile_size;

// texture coordinates go from 0...1, not 0...n, where n is the dimension
// of the image in pixels
var texture_width=1/tile_horizontal_count;
var texture_height=1/tile_vertical_count;

var xtex=tile.tile_x*texture_width;
var ytex=tile.tile_y*texture_width;

var color=tile.tile_color;
var alpha=tile.tile_alpha;

vertex_point_complete(buffer, xx, yy, zz, nx, ny, nz, xtex, ytex, color, alpha);
vertex_point_complete(buffer, xx+TILE_WIDTH, yy, zz, nx, ny, nz, xtex+texture_width, ytex, color, alpha);
vertex_point_complete(buffer, xx+TILE_WIDTH, yy+TILE_HEIGHT,zz, nx, ny, nz, xtex+texture_width, ytex+texture_height, color, alpha);

vertex_point_complete(buffer, xx+TILE_WIDTH, yy+TILE_HEIGHT, zz, nx, ny, nz, xtex+texture_width, ytex+texture_height, color, alpha);
vertex_point_complete(buffer, xx, yy+TILE_HEIGHT, zz, nx, ny, nz, xtex, ytex+texture_height, color, alpha);
vertex_point_complete(buffer, xx, yy, zz, nx, ny, nz, xtex, ytex, color, alpha);

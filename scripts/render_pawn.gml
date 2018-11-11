/// void render_pawn(Pawn, xx, yy, zz);

var pawn=argument0;
var xx=argument1;
var yy=argument2;
var zz=argument3;

var spritesheet_height=4;
var spritesheet_frames=4;
var frame=floor(pawn.frame);
var dir=pawn.map_direction;
var frame_width=sprite_get_width(pawn.overworld_sprite)/spritesheet_frames;
var frame_height=sprite_get_height(pawn.overworld_sprite)/spritesheet_height;

// move the sprite up so it can pivot around the X axis
transform_set(0, -frame_height, 0, 0, 0, 0, 1, 1, 1);
// rotate the sprite around the X axis
transform_add(0, 0, 0, 45, 0, 0, 1, 1, 1);
// move to the correct location
transform_add(xx*TILE_WIDTH, yy*TILE_HEIGHT, zz*TILE_DEPTH+frame_height, 0, 0, 0, 1, 1, 1);

draw_sprite_part(pawn.overworld_sprite, 0, frame*frame_width, dir*frame_height, frame_width, frame_height, 0, 0);

transform_reset();

/// void BattleDrawable.bg_draw_drawable();

// the surface is drawn in BattleDrawable.Step
// being in 3D mode sort of breaks surfaces, and targeting surfaces
// sort of breaks 3D mode, and that took me all day to figure out
// do you'd better appreciate it

d3d_transform_add_rotation_x(90);
d3d_transform_add_scaling(scale, scale, scale);
d3d_transform_add_translation(x, y, z);

draw_surface_ext(surface, -sprite_get_xoffset(sprite_index)*xscale, -sprite_get_yoffset(sprite_index)*yscale, xscale, yscale, rotation, c_white, 1);

d3d_transform_set_identity();

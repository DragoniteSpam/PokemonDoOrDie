/// void BattleDrawable.bg_draw_drawable();

// the surface is drawn in BattleDrawable.Step
// being in 3D mode sort of breaks surfaces, and targeting surfaces
// sort of breaks 3D mode, and that took me all day to figure out
// do you'd better appreciate it

d3d_transform_add_rotation_x(90);
// None of my sprites are the same size because why would they be,
// so we have to scale them up and scale them back down to make sure
// that they look like they're the same size
d3d_transform_add_scaling(scale*0.5, scale*0.5, scale*0.5);
d3d_transform_add_translation(x, y, z);

draw_surface_ext(surface, -sprite_get_xoffset(sprite_index)*xscale, -sprite_get_yoffset(sprite_index)*yscale, xscale, yscale, rotation, c_white, 1);

d3d_transform_set_identity();

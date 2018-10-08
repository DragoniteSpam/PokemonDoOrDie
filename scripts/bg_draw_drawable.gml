/// void BattleDrawable.bg_draw_drawable();

d3d_transform_add_rotation_x(90);
d3d_transform_add_scaling(scale, scale, scale);
d3d_transform_add_translation(x, y, z);


draw_sprite_ext(sprite_index, floor(image_index), 0, 0, xscale, yscale, rotation, color, alpha);

d3d_transform_set_identity();

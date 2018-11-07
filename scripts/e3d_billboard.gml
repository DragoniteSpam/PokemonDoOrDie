/// void e3d_billboard();

// todo support for alpha fades that dont go 0..1?
// todo this could probably be collapsed into the e3d_generic really easily

if (t<t_fadein){
    alpha=alpha+World.dt/t_fadein;
} else if (t<t_still){
    alpha=1;
} else if (t<t_fadeout){
    alpha=alpha-World.dt/(t_fadeout-t_still);
} else {
    alpha=0;
    instance_destroy(/*self*/);
}

d3d_transform_add_rotation_x(90+xrot);
d3d_transform_add_rotation_y(yrot);
// disregard direction, it's automatically oriented to face the camera
// game maker gurus will probably tell you to use the view matrix or something but
// honestly that's for people who don't object to using their brains
d3d_transform_add_rotation_z(point_direction(Camera.x, Camera.y, x, y)-90);
d3d_transform_add_scaling(scale, scale, scale);
d3d_transform_add_translation(x, y, z);

draw_sprite_ext(sprite_index, floor(image_index), 0, 0, xscale, yscale, rotation, color, alpha);

d3d_transform_set_identity();

if (animation_loop){
    image_index=(image_index+animation_rate*World.dt)%image_number;
} else {
    image_index=min(image_number-1, image_index+animation_rate*World.dt);
}

x=x+xspeed*World.dt;
y=y+yspeed*World.dt;
z=z+zspeed*World.dt;

xspeed=xspeed*(1-damping*World.dt);
yspeed=yspeed*(1-damping*World.dt);
zspeed=zspeed*(1-damping*World.dt);

t=t+World.dt;

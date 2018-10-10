var t_fadein=0.25;
var t_still=t_fadein+0.05;
var t_fadeout=t_still+0.25;

if (t<t_fadein){
    alpha=alpha+World.dt/t_fadein;
} else if (t<t_still){
} else if (t<t_fadeout){
    alpha=alpha-World.dt/(t_fadeout-t_still);
} else {
    instance_destroy();
}

draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, rotation, color, alpha);

t=t+World.dt;

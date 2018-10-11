/// Effect2D new_effect_world(x, y, z, xrot, yrot, zrot, scale, sprite, render, t_fadein, t_still, t_fadeout, [xscale], [yscale], [rotation], [color], [alpha], [animation rate], [animation loop?]);

with (instance_create(argument[0], argument[1], WorldEffect2D)){
    switch (argument_count){
        case 19:
            animation_loop=argument[18];
        case 18:
            animation_rate=argument[17];
        case 17:
            alpha=argument[16];
        case 16:
            color=argument[15];
        case 15:
            rotation=argument[14];
        case 14:
            yscale=argument[13];
        case 13:
            xscale=argument[12];
        default:
            z=argument[2];
            xrot=argument[3];
            yrot=argument[4];
            zrot=argument[5];
            scale=argument[6];
            sprite_index=argument[7];
            render=argument[8];
            t_fadein=argument[9];
            t_still=argument[10];
            t_fadeout=argument[11];
            break;
    }

    return id;
}

/// Effect2D new_effect_2d(x, y, sprite, render, [xscale], [yscale], [rotation], [color], [alpha]);

with (instance_create(argument[0], argument[1], Effect2D)){
    switch (argument_count){
        case 9:
            alpha=argument[8];
        case 8:
            color=argument[7];
        case 7:
            rotation=argument[6];
        case 6:
            yscale=argument[5];
        case 5:
            xscale=argument[4];
        default:
            sprite_index=argument[2];
            render=argument[3];
            break;
    }

    return id;
}

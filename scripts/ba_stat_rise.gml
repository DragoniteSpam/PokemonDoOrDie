var t_mask_fadein=0.2;
var t_mask_animation=t_mask_fadein+0.4;
var t_mask_fadeout=t_mask_animation+0.2;
var t_wait=t_mask_fadeout+0.15;

var mask_speed_x=0;
var mask_speed_y=-64;

if (t==0){
    user.mask_script=bm_stat_raise;
    user.misc_data[? "mask alpha"]=0;
    user.misc_data[? "mask x"]=0;
    user.misc_data[? "mask y"]=0;
} else if (t<t_mask_fadein){
    user.misc_data[? "mask alpha"]=user.misc_data[? "mask alpha"]+World.dt/t_mask_fadein;
} else if (t<t_mask_animation){
} else if (t<t_mask_fadeout){
    user.misc_data[? "mask alpha"]=user.misc_data[? "mask alpha"]-World.dt/t_mask_fadein;
} else if (t<t_wait){
    // wait
} else {
    user.mask_script=null;
    instance_destroy();
    with (Battle){
        input_ready=true;
        battle_advance();
    }
}

user.misc_data[? "mask x"]=user.misc_data[? "mask x"]+mask_speed_x*World.dt;
user.misc_data[? "mask y"]=user.misc_data[? "mask y"]+mask_speed_y*World.dt;

t=t+World.dt;

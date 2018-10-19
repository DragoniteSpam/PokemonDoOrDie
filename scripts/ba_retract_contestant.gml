var t_shrink_time=1;

if (t==0){
    user.mask_script=bm_retract_submit;
    user.misc_data[? "mask alpha"]=0;
} else if (t<t_shrink_time){
    user.misc_data[? "mask alpha"]=approach(user.misc_data[? "mask alpha"], 1, World.dt/t_shrink_time);
    user.xscale=approach(user.xscale, 0, t_shrink_time*World.dt);
    user.yscale=user.xscale;
    user.xscale=lerp(user.xscale, 1, t_shrink_time*World.dt);
    user.yscale=user.xscale;
} else {
    user.mask_script=null;
    instance_destroy();
    Battle.input_ready=true;
    battle_advance();
}

t=t+World.dt;

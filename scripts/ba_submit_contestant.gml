var t_rise_time=1;

if (t==0){
    user.mask_script=bm_retract_submit;
    user.misc_data[? "mask alpha"]=1;
} else if (t<t_rise_time){
    user.misc_data[? "mask alpha"]=approach(user.misc_data[? "mask alpha"], 0, World.dt/t_rise_time);
    user.xscale=approach(user.xscale, 1, t_rise_time*World.dt);
    user.yscale=user.xscale;
} else {
    user.mask_script=null;
    instance_destroy();
    Battle.input_ready=true;
    battle_advance();
}

t=t+World.dt;

var animation_time=0.35;
var amount=misc_data[? "amount"];
var f=amount/user.act_hp_max/animation_time*World.dt;

if (t<animation_time&&user.act_hp_current>0){
    user.act_hp_current=max(0, user.act_hp_current-f);
} else {
    // this will hopefully be the correct value but just in case there's
    // floating point imprecision or something
    user.act_hp_current=floor(misc_data[? "initial"]-amount);
    instance_destroy();
    with (Battle){
        input_ready=true;
        battle_advance();
    }
}

t=t+World.dt;

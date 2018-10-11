var clear_time=1;   // the amount of time it should take the hp bar to fully empty
var amount=misc_data[? "amount"];           // the amount of hp that has to scroll

var delta_f=get_progress_bar_scroll_rate(clear_time, amount, user.act_hp_max);
var scroll_time=get_progress_bar_scroll_time(clear_time, amount, user.act_hp_max);

if (t<scroll_time&&user.act_hp_current>0){
    user.act_hp_current=max(0, user.act_hp_current-delta_f);
} else {
    // this will hopefully be the correct value but just in case there's
    // floating point imprecision or something
    user.act_hp_current=max(0, floor(misc_data[? "initial"]-amount));
    instance_destroy();
    with (Battle){
        input_ready=true;
        battle_advance();
    }
}

t=t+World.dt;

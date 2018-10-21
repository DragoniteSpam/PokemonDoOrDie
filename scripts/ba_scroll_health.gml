var clear_time=1;   // the amount of time it should take the hp bar to fully empty
var amount=misc_data[? "amount"];           // the amount of hp that has to scroll

var delta_f=get_progress_bar_scroll_rate(clear_time, amount, user.act[Stats.HP]);
var scroll_time=get_progress_bar_scroll_time(clear_time, amount, user.act[Stats.HP]);

// if the value is exactly 0 or max hp, continue, but not until then
if (t<scroll_time&&is_clamped(user.act_hp, 0.1, user.act[Stats.HP]-0.1)){
    user.act_hp=max(0, user.act_hp-delta_f);
} else {
    // this will hopefully be the correct value but just in case there's
    // floating point imprecision or something
    user.act_hp=max(0, floor(misc_data[? "initial"]-amount));
    instance_destroy();
    Battle.input_ready=true;
    battle_advance();
}

t=t+World.dt;

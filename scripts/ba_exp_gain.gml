var animation_time=0.35;
var gain=misc_data[? "gain"];
var current=misc_data[? "current"];
var base=get_pokemon(user.species);

var current_level=get_level(current, base.growth_rate);
var current_level_exp=get_experience(current_level, base.growth_rate);
var next_level_exp=get_experience(current_level+1, base.growth_rate);
var difference_exp=next_level_exp-current_level_exp;

var f=gain/difference_exp/animation_time*World.dt;

// todo sound effects: both the bubbling noise while gaining experience and the
// fanfare if/when you gain a level

// if we hit a level-up, we stop
if (t<animation_time&&user.experience<next_level_exp){
    user.experience=user.experience+f;
} else {
    // cut it off here! don't worry, overflow isn't lost, it's just saved in the command to continue gaining
    // after the level up message has been shown
    user.experience=min(current+gain, next_level_exp);
    instance_destroy();
    with (Battle){
        input_ready=true;
        battle_advance();
    }
}

t=t+World.dt;

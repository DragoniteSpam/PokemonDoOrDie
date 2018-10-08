// pixels to move
var slide_rate_x=user.battle_x-user.offscreen_x;
var slide_rate_y=user.battle_y-user.offscreen_y;
// how long the fade transition takes
var fade_time=user.fade_time;
var still_time=fade_time+0.25;
// units per second
var slide_rate=60;
// how long the slide takes
var transition_time=still_time+user.distance/slide_rate;

if (t<fade_time){
    user.alpha=user.alpha+1/fade_time*World.dt;
} else if (t<still_time){
    // do nothing
} else if (t<transition_time){
    user.x=user.x+slide_rate_x*World.dt;
    user.y=user.y-slide_rate_y*World.dt;
} else {
    instance_destroy();
    with (Battle){
        input_ready=true;
        battle_advance();
    }
}

t=t+World.dt;

/// double get_progress_bar_scroll_rate(clear time, amount, max amount);
// see also: get_progress_bar_scroll_time

var delta_bar=argument1/argument2;
var scroll_time=argument0*delta_bar;
var f=argument1/scroll_time;
return f*World.dt;

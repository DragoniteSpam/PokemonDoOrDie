/// void draw_health_bar(x, y, x2, y2, f);

var c;
if (argument4>=0.5){
    c=c_health_high;
} else if (argument4>=0.25){
    c=c_health_mid;
} else {
    c=c_health_low;
}

draw_rectangle_colour(argument0, argument1, argument2, argument3, c_white, c_white, c_white, c_white, false);
draw_rectangle_colour(argument0, argument1, argument0+(argument2-argument0)*argument4, argument3, c, c, c, c, false);

// todo when you have time reverse the direction of these lines so you can turn
// culling back off and save a vertex batch
d3d_set_culling(false);
var w=4;
draw_line_width_colour(argument0, argument1, argument2, argument1, w, c_black, c_black);
draw_line_width_colour(argument0, argument3, argument2, argument3, w, c_black, c_black);
draw_line_width_colour(argument0, argument1, argument0, argument3, w, c_black, c_black);
draw_line_width_colour(argument2, argument1, argument2, argument3, w, c_black, c_black);
d3d_set_culling(true);

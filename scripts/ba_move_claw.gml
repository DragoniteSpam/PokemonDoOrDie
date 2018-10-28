/// void ba_move_claw();

var continue_now=true;
for (var i=0; i<ds_list_size(target_list); i++){
    if (Battle.contestants[| target_list[| i]].animate_on){
        continue_now=false;
        break;
    }
}

var t_wait=0.25;
var t_advance=t_wait+0.2;
var t_claw_1=t_advance+0.75;
var t_claw_2=t_claw_1+0.75;
var t_retract=t_claw_2+0.2;
var t_terminate=t_retract+0.25;

var advance_speed=60;
var retract_speed=60;
var midpoint=BATTLEFIELD_SIZE/2;

if (t<t_wait){
    // wait, obviously
} else if (t<t_advance){
    var draw=Battle.drawables[| user.position];
    var dir=draw.center_direction;
    var xc=advance_speed*dcos(dir)*World.dt;
    var yc=-advance_speed*dsin(dir)*World.dt;
    draw.x=draw.x+xc;
    draw.y=draw.y+yc;
} else if (t<t_claw_1){
    if (!ds_map_exists(misc_data, 'claw')){
        for (var i=0; i<ds_list_size(target_list); i++){
            var target=Battle.contestants[| target_list[|  i]];
            // fade timestamps
            var t_fadein=0;
            var t_still=t_fadein+1.5;
            var t_fadeout=t_still+0.25;
            // other stuff
            var draw=Battle.drawables[| target_list[| i]];
            var f=0.35;
            var relative_z=sprite_get_height(draw.sprite_index)*f*draw.scale*draw.yscale;
            var position=world_to_2d(draw.x, draw.y, draw.z+relative_z);
            // animation
            var animation_rate=9;
            // you may want to save this to the misc data map but in this case we just fire and forget
            misc_data[? 'claw']=new_effect_2d(position[vec2.xx], position[vec2.yy], spr_anim_move_claw, e2d_generic, t_fadein, t_still, t_fadeout, 1.5, 1.5, 0, misc_data[? 'color'], 0, animation_rate, false);
        }
        audio_play_sound(se_move_slash, 1, false);
    }
    // otherwise wait
} else if (t<t_claw_2){
    // dont repeat yourself, they say
    if (!ds_map_exists(misc_data, 'claw 2 se')){
        audio_play_sound(se_move_slash, 1, false);
        misc_data[? 'claw 2 se']=true
    }
    // otherwise wait again
} else if (t<t_retract){
    var draw=Battle.drawables[| user.position];
    var dir=draw.center_direction+180;
    var xc=advance_speed*dcos(dir)*World.dt;
    var yc=-advance_speed*dsin(dir)*World.dt;
    draw.x=draw.x+xc;
    draw.y=draw.y+yc;
} else if (t<t_terminate){
    // wait some more
} else {
    continue_now=true;
}

if (continue_now){
    instance_destroy();
    Battle.input_ready=true;
    battle_advance();
}

t=t+World.dt;

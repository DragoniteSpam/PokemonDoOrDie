/// void ba_move_opp_basic();

var t_wait=0.25;
var t_advance=t_wait+0.2;
var t_wait_2=t_advance+0.25;
var t_retract=t_wait_2+0.2;
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
} else if (t<t_wait_2){
    if (!ds_map_exists(misc_data, "hit flash")){
        for (var i=0; i<ds_list_size(target_list); i++){
            var draw=Battle.drawables[| target_list[| i].position];
            var f=0.35;
            var relative_z=sprite_get_height(draw.sprite_index)*f*draw.scale*draw.yscale;
            var position=world_to_2d(draw.x, draw.y, draw.z+relative_z);
            (new_effect_2d(position[vec2.xx], position[vec2.yy], spr_anim_move_tackle, e2d_hit)).alpha=0;
        }
        audio_play_sound(se_hit, 1, false);
        misc_data[? "hit flash"]=true;
    }
    // otherwise wait
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
    instance_destroy();
    with (Battle){
        input_ready=true;
        battle_advance();
    }
}

t=t+World.dt;

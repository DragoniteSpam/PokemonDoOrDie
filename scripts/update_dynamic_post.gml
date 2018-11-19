/// void update_dynamic_post(thing);
// this script is called by World because thing is asleep. make
// sure to prefix all of thing's instance variables with thing.

var thing=argument0;
var map=get_active_map();

if (thing.xx<thing.target_xx){
    thing.map_direction=Directions.RIGHT;
} else if (thing.xx>thing.target_xx){
    thing.map_direction=Directions.LEFT;
} else if (thing.yy<thing.target_yy){
    thing.map_direction=Directions.DOWN;
} else if (thing.yy>thing.target_yy){
    thing.map_direction=Directions.UP;
}

if (!thing.moving&&(thing.target_xx!=thing.xx||thing.target_yy!=thing.yy||thing.target_zz!=thing.zz)){
    if (map_get_solid(get_active_map(), thing.target_xx, thing.target_yy, thing.target_zz)/*there will be some other conditions in here as things like water and Surf are enabled*/){
        thing.target_xx=thing.previous_xx;
        thing.target_yy=thing.previous_yy;
        thing.target_zz=thing.previous_zz;
    } else {
        thing.movement_free=false;
        thing.moving=true;
        if (thing.am_solid){
            map_remove_contents(map, thing, thing.xx, thing.yy, thing.zz);
            map_add_contents(map, thing, thing.target_xx, thing.target_yy, thing.target_zz);
        }
    }
}

if (thing.moving){
    var fstep=thing.mspd*dt;
    if (max(abs(thing.target_xx-thing.xx), abs(thing.target_yy-thing.yy), abs(thing.target_zz-thing.zz))<=fstep){
        thing.xx=thing.target_xx;
        thing.yy=thing.target_yy;
        thing.zz=thing.target_zz;
        thing.moving=false;
        script_execute(thing.update_new_cell, thing);
    } else {
        thing.xx=thing.xx+fstep*sign(thing.target_xx-thing.xx);
        thing.yy=thing.yy+fstep*sign(thing.target_yy-thing.yy);
        thing.zz=thing.zz+fstep*sign(thing.target_zz-thing.zz);
    }
    // todo stick this in Pawn.update_post (which should call this script as well)
    // because not all EntityDynamic are going to know what to do with animation frame
    thing.frame=thing.frame+PAWN_ANIMATION_FRAMES_PER_SECOND*dt*thing.mspd;
    // i'm not sure if the above will still behave correctly if you change the
    // movement speed but that'll have to take care of itself later
}

if (!thing.moving){
    thing.frame=0;
    thing.movement_free=true;
    script_execute(thing.update_still, thing);
}

/// void update_dynamic_post(thing);
// this script is called by World because thing is asleep. make
// sure to prefix all of thing's instance variables with thing.

var thing=argument0;
var map=get_active_map();

var hdir=round(point_direction(thing.xx, thing.yy, thing.target_xx, thing.target_yy))
var hdist=point_distance(thing.xx, thing.yy, thing.target_xx, thing.target_yy)
if (hdist>0){
    if (hdir<=45||hdir>=315){
        thing.map_direction=Directions.RIGHT;
    } else if (hdir<135){
        thing.map_direction=Directions.UP;
    } else if (hdir<=225){
        thing.map_direction=Directions.LEFT;
    } else {
        thing.map_direction=Directions.DOWN;
    }
}
// this works if you're only allowed to move in four directions but doesn't pretty much
// anywhere else
/*if (thing.xx<thing.target_xx){
    thing.map_direction=Directions.RIGHT;
} else if (thing.xx>thing.target_xx){
    thing.map_direction=Directions.LEFT;
} else if (thing.yy<thing.target_yy){
    thing.map_direction=Directions.DOWN;
} else if (thing.yy>thing.target_yy){
    thing.map_direction=Directions.UP;
}*/

var was_moving=thing.moving;

if (!thing.moving&&(thing.target_xx!=thing.xx||thing.target_yy!=thing.yy||thing.target_zz!=thing.zz)){
    // i'm not entirely sure why round() works here and floor() doesn't, since you'd think you'd want
    // to check the solid-ness of the cell that you're actually in (5.8, 6.7 -> 5, 6) and not the
    // nearest one
    if (map_get_solid(get_active_map(), round(thing.target_xx), round(thing.target_yy), round(thing.target_zz))
        /*there will be some other conditions in here as things like water and Surf are enabled*/){
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

var has_moved=thing.moving;

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
    thing.movement_free=true;
    if (!has_moved){
        thing.frame=0;
        script_execute(thing.update_still, thing);
    }
}

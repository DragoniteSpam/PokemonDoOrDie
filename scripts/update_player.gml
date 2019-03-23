/// void update_player(entity);
// this script is called by World because thing is asleep. make
// sure to prefix all of thing's instance variables with thing.

var thing=argument0;

if (thing.movement_free){
    thing.previous_xx=thing.xx;
    thing.previous_yy=thing.yy;
    thing.previous_zz=thing.zz;
    
    // may collapse these into a smaller block of code later, but not now
    if (World.game_player_grid){
        if (Controller.left){
            thing.target_xx--;
        }
        if (Controller.right){
            thing.target_xx++;
        }
        if (Controller.up){
            thing.target_yy--;
        }
        if (Controller.down){
            thing.target_yy++;
        }
    } else {
        var fstep=thing.mspd*dt;
        if (Controller.ls_magnitude>Controller.gamepad_dead_zone){
            thing.target_xx=thing.xx+fstep*dcos(Controller.ls_angle);
            thing.target_yy=thing.yy-fstep*dsin(Controller.ls_angle);
        }
    }
}

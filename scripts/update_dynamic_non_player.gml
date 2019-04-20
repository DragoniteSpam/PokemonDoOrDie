/// void update_dynamic_non_player(Entity);

var thing=argument0;
var autonomous=guid_get(thing.autonomous_movement_route);

if (autonomous!=noone){
    if (!thing.moving){
        var data=autonomous.steps[thing.autonomous_step];
        switch (data[@ 0]){
            case MoveRouteActions.MOVE_DOWN:
                var howfar=data[@ 1];
                thing.target_yy=thing.yy+howfar;
                break;
            case MoveRouteActions.MOVE_UP:
                var howfar=data[@ 1];
                thing.target_yy=thing.yy-howfar;
                break;
            case MoveRouteActions.MOVE_LEFT:
                var howfar=data[@ 1];
                thing.target_xx=thing.xx-howfar;
                break;
            case MoveRouteActions.MOVE_RIGHT:
                var howfar=data[@ 1];
                thing.target_xx=thing.xx+howfar;
                break;
            case MoveRouteActions.MOVE_LOWER_LEFT:
                var howfar=data[@ 1];
                thing.target_xx=thing.xx-howfar;
                thing.target_yy=thing.yy+howfar;
                break;
            case MoveRouteActions.MOVE_LOWER_RIGHT:
                var howfar=data[@ 1];
                thing.target_xx=thing.xx+howfar;
                thing.target_yy=thing.yy+howfar;
                break;
            case MoveRouteActions.MOVE_UPPER_LEFT:
                var howfar=data[@ 1];
                thing.target_xx=thing.xx-howfar;
                thing.target_yy=thing.yy-howfar;
                break;
            case MoveRouteActions.MOVE_UPPER_RIGHT:
                var howfar=data[@ 1];
                thing.target_xx=thing.xx+howfar;
                thing.target_yy=thing.yy+howfar;
                break;
            case MoveRouteActions.MOVE_RANDOM:
                if (choose(true, false)){
                    thing.target_xx=thing.xx+choose(-1, 1);
                } else {
                    thing.target_yy=thing.yy+choose(-1, 1);
                }
                break;
            case MoveRouteActions.MOVE_TOWARDS_PLAYER:
                // hey
                break;
            case MoveRouteActions.MOVE_AWAY_PLAYER:
                // hey
                break;
            case MoveRouteActions.MOVE_FORWARD:
                switch (thing.map_direction){
                    case Directions.RIGHT:
                        thing.target_xx=thing.xx+1;
                        break;
                    case Directions.LEFT:
                        thing.target_xx=thing.xx-1;
                        break;
                    case Directions.DOWN:
                        thing.target_yy=thing.yy+1;
                        break;
                    case Directions.UP:
                        thing.target_yy=thing.yy-1;
                        break;
                }
                break;
            case MoveRouteActions.MOVE_BACKWARD:
                switch (thing.map_direction){
                    case Directions.RIGHT:
                        thing.target_xx=thing.xx-1;
                        break;
                    case Directions.LEFT:
                        thing.target_xx=thing.xx+1;
                        break;
                    case Directions.DOWN:
                        thing.target_yy=thing.yy-1;
                        break;
                    case Directions.UP:
                        thing.target_yy=thing.yy+1;
                        break;
                }
                break;
            case MoveRouteActions.MOVE_JUMP:
                // data[@ 1] was originally map name until i realized that doesnt make sense in a move route
                var newx=data[@ 2];
                var newy=data[@ 3];
                var newz=data[@ 4];
                break;
            case MoveRouteActions.MOVE_ACTUALLY_JUMP:
                var cells=data[@ 1];
                break;
            case MoveRouteActions.MOVE_TO:
                var newx=data[@ 1];
                var newy=data[@ 2];
                break;
            case MoveRouteActions.WAIT:
                var seconds=data[@ 1];
                break;
            // column 2
            case MoveRouteActions.TURN_DOWN:
                thing.map_direction=Directions.DOWN;
                break;
            case MoveRouteActions.TURN_LEFT:
                thing.map_direction=Directions.LEFT;
                break;
            case MoveRouteActions.TURN_RIGHT:
                thing.map_direction=Directions.RIGHT;
                break;
            case MoveRouteActions.TURN_UP:
                thing.map_direction=Directions.UP;
                break;
            case MoveRouteActions.TURN_90_RIGHT:
                thing.map_direction=(thing.map_direction+90)%360;
                break;
            case MoveRouteActions.TURN_90_LEFT:
                thing.map_direction=(thing.map_direction+270)%360;
                break;
            case MoveRouteActions.TURN_180:
                thing.map_direction=(thing.map_direction+180)%360;
                break;
            case MoveRouteActions.TURN_90_RANDOM:
                if (thing.map_direction==Directions.RIGHT||thing.map_direction==Directions.LEFT){
                    thing.map_direction=choose(Directions.UP, Directions.DOWN);
                } else {
                    thing.map_direction=choose(Directions.RIGHT, Directions.LEFT);
                }
                break;
            case MoveRouteActions.TURN_RANDOM:
                thing.map_direction=choose(Directions.RIGHT, Directions.LEFT, Directions.UP, Directions.DOWN);
                break;
            case MoveRouteActions.TURN_TOWARD_PLAYER:
                // hey
                break;
            case MoveRouteActions.TURN_AWAY_PLAYER:
                // hey
                break;
            // column 3
            case MoveRouteActions.SWITCH_ON:
                var index=data[@ 1];
                break;
            case MoveRouteActions.SWITCH_OFF:
                var index=data[@ 1];
                break;
            case MoveRouteActions.CHANGE_SPEED:
                var value=data[@ 1];
                break;
            case MoveRouteActions.CHANGE_FREQUENCY:
                var value=data[@ 1];
                break;
            case MoveRouteActions.WALKING_ANIM_ON:
                break;
            case MoveRouteActions.WALKING_ANIM_OFF:
                break;
            case MoveRouteActions.STEPPING_ANIM_ON:
                break;
            case MoveRouteActions.STEPPING_ANIM_OFF:
                break;
            case MoveRouteActions.DIRECTION_FIX_ON:
                break;
            case MoveRouteActions.DIRECTION_FIX_OFF:
                break;
            case MoveRouteActions.SOLID_ON:
                break;
            case MoveRouteActions.SOLID_OFF:
                break;
            case MoveRouteActions.TRANSPARENT_ON:
                break;
            case MoveRouteActions.TRANSPARENT_OFF:
                break;
            case MoveRouteActions.CHANGE_GRAPHIC:
                // not implemented
                break;
            case MoveRouteActions.CHANGE_OPACITY:
                var opacity=data[@ 1];
                break;
            case MoveRouteActions.CHANGE_TINT:
                // not implemented
                break;
            case MoveRouteActions.PLAY_SE:
                // not implemented
                break;
            case MoveRouteActions.EVENT:
                var event=guid_get(data[@ 1]);
                var entrypoint=guid_get(data[@ 2]);
                break;
        }
    }
}

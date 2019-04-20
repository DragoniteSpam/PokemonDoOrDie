/// void update_dynamic_non_player(Entity);

var thing=argument0;
var autonomous=guid_get(thing.autonomous_movement_route);

if (autonomous==noone){
    debug(thing.name+": "+string(thing.autonomous_movement_route))
} else {
    debug(thing.name+": "+autonomous.name);
}

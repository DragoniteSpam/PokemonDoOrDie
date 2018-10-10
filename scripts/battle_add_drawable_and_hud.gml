/// void battle_add_drawable_and_hud(Pawn, x, y, direction, sprite side, offscreen distance, fade time, hud offscreen x, hud offscreen y);

var drawable=instance_create(argument1, argument2, BattleDrawable);
drawable.sprite_index=argument0.battle_sprite;
// this is so it knows which way to animate
drawable.direction=argument3;
// this is the position in the world where the battler is positioned
drawable.battle_x=argument1;
drawable.battle_y=argument2;
// this is where trainers and pokémon slide in and out from
drawable.distance=argument5;
drawable.offscreen_x=argument1+drawable.distance*dcos(argument3+90);
drawable.offscreen_y=argument2-drawable.distance*dsin(argument3+90);
// it's more important for opponents to fade in and out than the player
drawable.fade_time=argument6;
drawable.center_direction=point_direction(argument1, argument2, BATTLEFIELD_SIZE/2, BATTLEFIELD_SIZE/2);

var hud=instance_create(argument7, argument8, BattleHUD);
hud.offscreen_x=argument7;
hud.offscreen_y=argument8;
if (argument7<room_width/2){
    hud.battle_x=argument7+UI_BATTLE_HUD_WIDTH+UI_BATTLE_HUD_BUFFER_X;
} else {
    hud.battle_x=argument7-UI_BATTLE_HUD_WIDTH-UI_BATTLE_HUD_BUFFER_X;
}
hud.battle_y=hud.offscreen_y;

/// void battle_add_position(Pawn, x, y, direction, offscreen distance, fade time, hud offscreen x, hud offscreen y);

with (instance_create(argument1, argument2, BattleDrawable)){
    owner=argument0;
    sprite_index=argument0.battle_sprite;
    // this is so it knows which way to animate
    direction=argument3;
    // this is the position in the world where the battler is positioned
    battle_x=argument1;
    battle_y=argument2;
    // this is where trainers and pokémon slide in and out from
    distance=argument4;
    offscreen_x=argument1+distance*dcos(argument3+90);
    offscreen_y=argument2-distance*dsin(argument3+90);
    // there may be a reason to change battle_z and offscreen_z but i can't think of one
    // it's more important for opponents to fade in and out than the player
    fade_time=argument5;
    center_direction=point_direction(argument1, argument2, BATTLEFIELD_SIZE/2, BATTLEFIELD_SIZE/2);
    
    hud=instance_create(argument6, argument7, BattleHUD);
    hud.offscreen_x=argument6;
    hud.offscreen_y=argument7;
    if (argument6<room_width/2){
        hud.battle_x=argument6+UI_BATTLE_HUD_WIDTH+UI_BATTLE_HUD_BUFFER_X;
    } else {
        hud.battle_x=argument6-UI_BATTLE_HUD_WIDTH-UI_BATTLE_HUD_BUFFER_X;
    }
    hud.battle_y=hud.offscreen_y;
    
    return id;
}

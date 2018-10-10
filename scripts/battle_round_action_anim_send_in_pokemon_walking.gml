/// void battle_round_action_anim_send_in_pokemon_walking(params);
// 0: team index

Battle.input_ready=false;
with (instance_create(0, 0, BattleAnimator)){
    var team=Battle.teams[| argument0[| 0]];
    
    user=Battle.drawables[| argument0[| 0]];
    user.alpha=0;
    user.sprite_index=get_pokemon_battle_sprite(Battle.contestants[| argument0[| 0]].species, team.sprite_side);
    user.image_index=0;
    user.x=user.offscreen_x;
    user.y=user.offscreen_y;
    script=ba_send_in_pokemon_walking;
}

/// void battle_round_action_anim_send_out_pokemon_hud(params);
// 0: contestant index

Battle.input_ready=false;
with (instance_create(0, 0, BattleAnimator)){
    var team=Battle.teams[| argument0[| 0]];
    var draw=Battle.drawables[| argument0[| 0]];
    
    user=draw.hud;
    user.x=user.battle_x;
    user.y=user.battle_y;
    script=ba_send_out_pokemon_hud;
}

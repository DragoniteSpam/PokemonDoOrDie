/// void battle_round_action_anim_submit_contestant(params);
// 0: drawable index

Battle.input_ready=false;
with (instance_create(0, 0, BattleAnimator)){
    user=Battle.drawables[| argument0[| 0]];
    user.alpha=1;
    user.x=user.battle_x;
    user.y=user.battle_y;
    user.z=user.battle_z;
    user.xscale=0;
    user.yscale=0;
    script=ba_submit_contestant;
}

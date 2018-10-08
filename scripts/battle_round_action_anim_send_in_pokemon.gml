/// void battle_round_action_anim_send_in_pokemon(params);
// 0: team index

Battle.input_ready=false;
with (instance_create(0, 0, BattleAnimator)){
    user=Battle.teams[| argument0[| 0]].drawable;
    script=ba_retract_trainer;
}

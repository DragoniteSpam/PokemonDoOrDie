/// void battle_individual_action_stat_rise_animation(params);
// 0: user

var params=argument0;

Battle.input_ready=false;
with (instance_create(0, 0, BattleAnimator)){
    user=Battle.drawables[| params[| 0].position];
    script=ba_stat_rise;
}

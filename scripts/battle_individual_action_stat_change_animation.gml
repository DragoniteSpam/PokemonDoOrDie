/// void battle_individual_action_stat_change_animation(params);
// 0: user
// 1: script (ba_stat_rise or ba_stat_fall)

var params=argument0;

Battle.input_ready=false;
with (instance_create(0, 0, BattleAnimator)){
    user=Battle.drawables[| params[| 0].position];
    script=params[| 1];
}

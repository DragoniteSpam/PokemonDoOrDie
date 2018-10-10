/// void battle_individual_action_death(BattleIndividualAction);
// 0: targets

var params=argument0;

Battle.input_ready=false;
with (instance_create(0, 0, BattleAnimator)){
    user=Battle.drawables[| params[| 0].position];
    script=ba_death;
}

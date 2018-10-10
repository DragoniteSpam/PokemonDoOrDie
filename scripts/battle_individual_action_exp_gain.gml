/// void battle_individual_action_exp_gain(BattleIndividualAction);
// 0: user
// 1: exp gained

var params=argument0;

Battle.input_ready=false;
with (instance_create(0, 0, BattleAnimator)){
    user=params[| 0];
    // this is to avoid imprecision that may occur while scrolling
    misc_data[? "current"]=user.experience;
    misc_data[? "gain"]=params[| 1];
    script=ba_exp_gain;
}

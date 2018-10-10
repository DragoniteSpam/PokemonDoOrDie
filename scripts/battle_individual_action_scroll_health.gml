/// void battle_individual_action_scroll_health(BattleIndividualAction);
// 0: target (single)
// 1: damage amount

var params=argument0;

Battle.input_ready=false;
with (instance_create(0, 0, BattleAnimator)){
    user=params[| 0];
    // this is to avoid imprecision that may occur while scrolling
    misc_data[? "initial"]=user.act_hp_current;
    misc_data[? "amount"]=params[| 1];
    script=ba_scroll_health;
}

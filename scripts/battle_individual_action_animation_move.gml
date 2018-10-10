/// void battle_individual_action_animation_move(BattleIndividualAction);
// 0: user
// 1: targets
// 2: move (object)

var params=argument0;

var scr;
if (params[| 0].owner==Camera.battle_pawn){
    scr=params[| 2].animation_you;
} else {
    scr=params[| 2].animation_opponent;
}

Battle.input_ready=false;
with (instance_create(0, 0, BattleAnimator)){
    user=params[| 0];
    target_list=params[| 1];
    script=scr;
}

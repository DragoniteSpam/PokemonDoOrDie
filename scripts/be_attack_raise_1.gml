/// void be_attack_raise_1(user, target);
// this activates instantly upon being processed, it does not
// get queued!

var target=argument1;   // unused here

if (argument0.mods[Stats.ATTACK]<STAT_MOD_LIMIT){
    ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_stat_change_animation, argument0, ba_stat_rise));
    ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_text, argument0.name+"'s Attack rose!"));
    ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_stat_set, argument0, Stats.ATTACK, argument0.mods[Stats.ATTACK]+1));
} else {
    ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_text, argument0.name+"'s Attack won't go any higher!"));
}

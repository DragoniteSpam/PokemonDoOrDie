/// void be_user_attack_raise_1(user, target, move id);
// this activates instantly upon being processed, it does not
// get queued!
// update: i don't know what the above comment is talking about.
// it gets queued.

var target=argument1;   // unused here
var move=argument2;     // unused here

with (instance_create(0, 0, BattleAppliedEffect)){
    if (argument0.mods[Stats.ATTACK]<STAT_MOD_LIMIT){
        be_help_stat_raise(argument0);
        ds_queue_enqueue(scheduled_actions, add_battle_individual_action(battle_individual_action_text, argument0.name+"'s Attack rose!"));
        ds_queue_enqueue(scheduled_actions, add_battle_individual_action(battle_individual_action_stat_set, argument0, Stats.ATTACK, argument0.mods[Stats.ATTACK]+1));
    } else {
        ds_queue_enqueue(scheduled_actions, add_battle_individual_action(battle_individual_action_text, argument0.name+"'s Attack won't go any higher!"));
    }
    
    return id;
}

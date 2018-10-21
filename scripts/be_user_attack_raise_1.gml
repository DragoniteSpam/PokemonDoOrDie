/// void be_user_attack_raise_1(user, target, move id);
// this activates instantly upon being processed, it does not
// get queued!
// update: i don't know what the above comment is talking about.
// it gets queued.

var target=argument1;   // unused here
var move=argument2;     // unused here

with (instance_create(0, 0, BattleAppliedEffect)){
    if (argument0.mods[Stats.ATTACK]<STAT_MOD_LIMIT){
        // todo this is going to be used again at some point so it's probably a good idea to make it its own script
        ds_queue_enqueue(actions, add_battle_individual_action(battle_individual_action_stat_change_animation, argument0, ba_stat_change, spr_anim_stat_rise, 0, -64, se_battle_increase));
        ds_queue_enqueue(actions, add_battle_individual_action(battle_individual_action_text, argument0.name+"'s Attack rose!"));
        ds_queue_enqueue(actions, add_battle_individual_action(battle_individual_action_stat_set, argument0, Stats.ATTACK, argument0.mods[Stats.ATTACK]+1));
    } else {
        ds_queue_enqueue(actions, add_battle_individual_action(battle_individual_action_text, argument0.name+"'s Attack won't go any higher!"));
    }
    
    return id;
}

/// void be_target_sp_defense_decrease_1(user, target, move);

var user=argument0;     // unused here
var move=argument2;     // unused here

with (instance_create(0, 0, BattleAppliedEffect)){
    if (argument1.mods[Stats.SPDEFENSE]>-STAT_MOD_LIMIT){
        // todo this is going to be used again at some point so it's probably a good idea to make it its own script
        ds_queue_enqueue(actions, add_battle_individual_action(battle_individual_action_stat_change_animation, argument1, ba_stat_change, spr_anim_stat_fall, 0, 64, se_battle_decrease));
        ds_queue_enqueue(actions, add_battle_individual_action(battle_individual_action_text, argument1.name+"'s Special Defense fell!"));
        ds_queue_enqueue(actions, add_battle_individual_action(battle_individual_action_stat_set, argument1, Stats.SPDEFENSE, argument1.mods[Stats.SPDEFENSE]-1));
    } else {
        ds_queue_enqueue(actions, add_battle_individual_action(battle_individual_action_text, argument1.name+"'s Special Defense won't go any lower!"));
    }
    
    return id;
}

/// void be_target_defense_decrease_1(user, target, move id);

var user=argument0;     // unused here
var move=argument2;     // unused here

with (instance_create(0, 0, BattleAppliedEffect)){
    if (argument1.mods[Stats.DEFENSE]>-STAT_MOD_LIMIT){
        be_help_stat_fall(argument1);
        ds_queue_enqueue(scheduled_actions, add_battle_individual_action(battle_individual_action_text, argument1.name+"'s Defense fell!"));
        ds_queue_enqueue(scheduled_actions, add_battle_individual_action(battle_individual_action_stat_set, argument1, Stats.DEFENSE, argument1.mods[Stats.DEFENSE]-1));
    } else {
        ds_queue_enqueue(scheduled_actions, add_battle_individual_action(battle_individual_action_text, argument1.name+"'s Defense won't go any lower!"));
    }
    
    return id;
}

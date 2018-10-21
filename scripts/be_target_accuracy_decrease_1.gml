/// void be_target_accuracy_decrease_1(user, target, move id);

var user=argument0;     // unused here
var move=argument2;     // unused here

with (instance_create(0, 0, BattleAppliedEffect)){
    if (argument1.mods[Stats.ACCURACY]>-STAT_MOD_LIMIT){
        be_help_stat_fall(argument1);
        ds_queue_enqueue(scheduled_actions, add_battle_individual_action(battle_individual_action_text, argument1.name+"'s Accuracy fell!"));
        ds_queue_enqueue(scheduled_actions, add_battle_individual_action(battle_individual_action_stat_set, argument1, Stats.ACCURACY, argument1.mods[Stats.ACCURACY]-1));
    } else {
        ds_queue_enqueue(scheduled_actions, add_battle_individual_action(battle_individual_action_text, argument1.name+"'s Accuracy won't go any lower!"));
    }
    
    return id;
}

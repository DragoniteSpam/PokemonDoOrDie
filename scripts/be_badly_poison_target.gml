/// void be_badly_poison_target(user, target, move id);

var user=argument0;     // unused here
var move=argument2;     // unused here

with (instance_create(0, 0, BattleAppliedEffect)){
    if (argument1.status==MajorStatus.NONE){
        ds_queue_enqueue(scheduled_actions, add_battle_individual_action(battle_individual_action_set_major_status, argument1, MajorStatus.TOXIC, 1));
        ds_queue_enqueue(scheduled_actions, add_battle_individual_action(battle_individual_action_text, argument1.name+" was badly poisoned!"));
    } else if (argument1.status==MajorStatus.POISON||argument1.status==MajorStatus.TOXIC){
        ds_queue_enqueue(scheduled_actions, add_battle_individual_action(battle_individual_action_text, argument1.name+" has already been poisoned!"));
    }
    
    return id;
}

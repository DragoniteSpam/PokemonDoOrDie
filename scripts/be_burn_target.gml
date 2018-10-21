/// void be_burn_target(user, target, move id);

var user=argument0;     // unused here
var move=argument2;     // unused here

with (instance_create(0, 0, BattleAppliedEffect)){
    if (argument1.status==MajorStatus.NONE){
        ds_queue_enqueue(scheduled_actions, add_battle_individual_action(battle_individual_action_set_major_status, argument1, MajorStatus.BURN));
        ds_queue_enqueue(scheduled_actions, add_battle_individual_action(battle_individual_action_text, argument1.name+" was burnt!"));
    } else if (argument1.status==MajorStatus.PARALYZE){
        ds_queue_enqueue(scheduled_actions, add_battle_individual_action(battle_individual_action_text, argument1.name+" has already been burnt!"));
    }
    
    return id;
}

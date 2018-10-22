/// void be_poison_target(user, target, move id);

var user=argument0;     // unused here
var move=argument2;     // unused here

with (instance_create(0, 0, BattleAppliedEffect)){
    if (get_matchup_on(Types.POISON, argument1)>0&&!has_type(argument1, Types.POISON)){
        if (argument1.status==MajorStatus.NONE){
            ds_queue_enqueue(scheduled_actions, add_battle_individual_action(battle_individual_action_set_major_status, argument1, MajorStatus.POISON));
            ds_queue_enqueue(scheduled_actions, add_battle_individual_action(battle_individual_action_text, argument1.name+" was poisoned!"));
        } else if (argument1.status==MajorStatus.POISON){
            ds_queue_enqueue(scheduled_actions, add_battle_individual_action(battle_individual_action_text, argument1.name+" has already been poisoned!"));
        }
    }
    
    return id;
}

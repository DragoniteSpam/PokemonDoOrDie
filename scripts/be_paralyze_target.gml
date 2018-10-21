/// void be_paralyze_target(user, target, move id);

var user=argument0;     // unused here
var move=argument2;     // unused here

with (instance_create(0, 0, BattleAppliedEffect)){
    // if the target is immune to the move's type they shouldn't be affected by
    // it anyway, but there was a note about it on essentials wiki so i'm going
    // to check that anyway as a precaution
    if (get_matchup_on(get_move(argument2).type, argument1)>0){
        if (argument1.status==MajorStatus.NONE){
            ds_queue_enqueue(scheduled_actions, add_battle_individual_action(battle_individual_action_set_major_status, argument1, MajorStatus.PARALYZE));
            ds_queue_enqueue(scheduled_actions, add_battle_individual_action(battle_individual_action_text, argument1.name+" was paralyzed!"));
        } else if (argument1.status==MajorStatus.PARALYZE){
            ds_queue_enqueue(scheduled_actions, add_battle_individual_action(battle_individual_action_text, argument1.name+" has already been paralyzed!"));
        }
    }
    
    return id;
}

/// void be_user_speed_raise_1(user, target, move id);

var target=argument1;   // unused here
var move=argument2;     // unused here

with (instance_create(0, 0, BattleAppliedEffect)){
    if (argument0.mods[Stats.SPEED]<STAT_MOD_LIMIT){
        be_help_stat_raise(argument0);
        ds_queue_enqueue(scheduled_actions, add_battle_individual_action(battle_individual_action_text, argument0.name+"'s Speed rose!"));
        ds_queue_enqueue(scheduled_actions, add_battle_individual_action(battle_individual_action_stat_set, argument0, Stats.SPEED, argument0.mods[Stats.SPEED]+1));
    } else {
        ds_queue_enqueue(scheduled_actions, add_battle_individual_action(battle_individual_action_text, argument0.name+"'s Speed won't go any higher!"));
    }
    
    return id;
}

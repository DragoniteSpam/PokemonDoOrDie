/// void be_user_sp_attack_raise_1(user, target, move id);

var target=argument1;   // unused here
var move=argument2;     // unused here

with (instance_create(0, 0, BattleAppliedEffect)){
    if (argument0.mods[Stats.SPATTACK]<STAT_MOD_LIMIT){
        be_help_stat_raise(argument0);
        ds_queue_enqueue(scheduled_actions, add_battle_individual_action(battle_individual_action_text, argument0.name+"'s Special Attack rose!"));
        ds_queue_enqueue(scheduled_actions, add_battle_individual_action(battle_individual_action_stat_set, argument0, Stats.SPATTACK, argument0.mods[Stats.SPATTACK]+1));
    } else {
        ds_queue_enqueue(scheduled_actions, add_battle_individual_action(battle_individual_action_text, argument0.name+"'s Special Attack won't go any higher!"));
    }
    
    return id;
}

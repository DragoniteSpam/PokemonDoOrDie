/// void be_reflect(user, target, move);

var target=argument1;   // unused here
var move=argument2;     // unused here

with (instance_create(0, 0, BattleAppliedEffect)){
    if (user.team.reduce_physical_damage_turns>0){
        ds_queue_enqueue(actions, add_battle_individual_action(battle_individual_action_text, argument0.owner.team.name+"'s team Defense increased!"));
        argument0.owner.team.reduce_physical_damage_turns=World.settings.battle.damage_filter_turns;
    }
    
    return id;
}

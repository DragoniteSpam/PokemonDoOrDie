/// void be_user_heal_half(user, target, move id);

var user=argument0;     // unused here
var target=argument1;   // unused here

with (instance_create(0, 0, BattleAppliedEffect)){
    if (argument0.act_hp<argument0.act[Stats.HP]){
        var amount=min(floor(argument0.act[Stats.HP]/2), argument0.act[Stats.HP]-argument0.act_hp);
        ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_scroll_health, argument0, amount));
        ds_queue_enqueue(actions, add_battle_individual_action(battle_individual_action_text, argument0.name+"'s health was restored!"));
    } else {
        ds_queue_enqueue(actions, add_battle_individual_action(battle_individual_action_text, argument0.name+"is already healthy!"));
    }
    
    return id;
}
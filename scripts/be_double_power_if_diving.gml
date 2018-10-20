/// void be_double_power_if_diving(user, target, move);

var user=argument0;     // unused here
var target=argument1;   // unused here

with (instance_create(0, 0, BattleAppliedEffect)){
    ds_queue_enqueue(actions, add_battle_individual_action(battle_individual_action_text, "("+argument2.name+" has an effect that has not been implemented yet:#"+
        "[hit and double power if target is diving])"));
    
    return id;
}

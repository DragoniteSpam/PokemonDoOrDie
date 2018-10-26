/// void bi_action_full_restore(queue, user, item);

ds_queue_enqueue(argument0, add_battle_individual_action(battle_individual_action_text, argument1.owner.name+" used a(n) "+get_item(argument2).name+" on "+argument1.name+"!"));
var status=argument1.status;
ds_queue_enqueue(argument0, add_battle_individual_action(battle_individual_action_set_major_status, argument1, MajorStatus.NONE));
var amount=argument1.act[Stats.HP]-argument1.act_hp;
if (amount>0){
    ds_queue_enqueue(argument0, add_battle_individual_action(battle_individual_action_scroll_health, argument1, -amount));
}
if (amount>0){
    ds_queue_enqueue(argument0, add_battle_individual_action(battle_individual_action_text, argument1.name+"'s health was restored by "+string(amount)+" point(s)!"));
}
if (status!=MajorStatus.NONE){
    ds_queue_enqueue(argument0, add_battle_individual_action(battle_individual_action_text, argument1.name+"'s "+string_lower(World.major_status_names[status])+" was cured!"));
}
pawn_remove_item(argument1.owner, argument2, 1);

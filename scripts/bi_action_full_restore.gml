/// void bi_action_full_restore(queue, user, item);

ds_queue_enqueue(argument0, add_battle_individual_action(battle_individual_action_text, L('%0 used a(n) %1 on %2!', argument1.owner.name, get_item(argument2).name, argument1.name)));
var status=argument1.status;
ds_queue_enqueue(argument0, add_battle_individual_action(battle_individual_action_set_major_status, argument1, MajorStatus.NONE));
var amount=argument1.act[Stats.HP]-argument1.act_hp;
if (amount>0){
    ds_queue_enqueue(argument0, add_battle_individual_action(battle_individual_action_scroll_health, argument1, -amount));
}
if (amount>0){
    if (amount==1){
        ds_queue_enqueue(argument0, add_battle_individual_action(battle_individual_action_text, L("%0's health was restored by %1 point!", argument1.name, amount)));
    } else {
        ds_queue_enqueue(argument0, add_battle_individual_action(battle_individual_action_text, L("%0's health was restored by %1 points!", argument1.name, amount)));
    }
}
if (status!=MajorStatus.NONE){
    ds_queue_enqueue(argument0, add_battle_individual_action(battle_individual_action_text, L("%0's %1 was cured!", argument1.name, string_lower(World.major_status_names[status]))));
}
pawn_remove_item(argument1.owner, argument2, 1);

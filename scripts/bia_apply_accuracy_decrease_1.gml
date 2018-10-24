/// boolean bia_apply_accuracy_decrease_1(queue, nullable user, target, nullable DataMove);

var queue=argument[0];
var user=argument[1];
var target=argument[2];
var move=argument[3];

if (target.mods[Stats.ACCURACY]>-STAT_MOD_LIMIT){
    be_help_stat_fall(queue, target);
    ds_queue_enqueue(queue, add_battle_individual_action(battle_individual_action_text, target.name+"'s Accuracy fell!"));
    ds_queue_enqueue(queue, add_battle_individual_action(battle_individual_action_stat_set, target, Stats.ACCURACY, target.mods[Stats.ACCURACY]-1));
    return true;
} else {
    ds_queue_enqueue(queue, add_battle_individual_action(battle_individual_action_text, target.name+"'s Accuracy won't go any lower!"));
}

return false;

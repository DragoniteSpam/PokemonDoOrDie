/// boolean bia_apply_attack_raise_1(queue, nullable user, target, nullable DataMove);

var queue=argument[0];
var user=argument[1];
var target=argument[2];
var move=argument[3];

if (pokemon_can_raise_stat(target, Stats.ATTACK)){
    be_help_stat_raise(queue, target);
    ds_queue_enqueue(queue, add_battle_individual_action(battle_individual_action_text, L("%0's Attack rose!", target.name)));
    ds_queue_enqueue(queue, add_battle_individual_action(battle_individual_action_stat_set, target, Stats.ATTACK, target.mods[Stats.ATTACK]+1));
    return true;
} else {
    ds_queue_enqueue(queue, add_battle_individual_action(battle_individual_action_text, L("%0's Attack won't go any higher!", target.name)));
}

return false;

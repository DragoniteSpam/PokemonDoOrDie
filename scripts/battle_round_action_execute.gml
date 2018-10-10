/// void battle_round_action_execute(params);
// 0: BattleExecutableAction

var exe=argument0[| 0];

var pokemon=exe.user;

switch (exe.action){
    case BattleActions.MOVE:
        var move=World.all_moves[exe.value];
        ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_text, pokemon.name+" used "+move.name+"!"));
        // todo: accuracy checks/other conditions under which a move may fail
        
        ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_animation_move, pokemon, ds_list_clone(exe.targets), move/*there may be other data that needs to go here at some point but i'm pretty sure it can all be derived from this*/));
        break;
    case BattleActions.ITEM:
        ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_text, pokemon.name+" used a(n) "+World.all_items[exe.value].name+"!"));
        break;
    case BattleActions.SWITCH:
        ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_text, pokemon.name+" switched to "+exe.value.name+"!"));
        break;
    case BattleActions.FLEE:
        ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_text, pokemon.name+" fled!"));
        break;
}

with (exe){
    instance_destroy();
}

// continue:
battle_debug("");

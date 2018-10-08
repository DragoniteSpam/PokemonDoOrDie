/// void battle_round_action_execute(params);
// 0: BattleExecutableAction

var exe=argument0[| 0];

var pokemon=exe.user;

// continue: inside each of the message()s
switch (exe.action){
    case BattleActions.MOVE:
        message(pokemon.name+" used "+World.all_moves[exe.value].name+"!");
        break;
    case BattleActions.ITEM:
        message(pokemon.name+" used a(n) "+World.all_items[exe.value].name+"!");
        break;
    case BattleActions.SWITCH:
        message(pokemon.name+" switched to "+exe.value.name+"!");
        break;
    case BattleActions.FLEE:
        message(pokemon.name+" fled!");
        break;
}

with (exe){
    instance_destroy();
}

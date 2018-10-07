/// void battle_round_action_execute(params);
// 0: BattleExecutableAction

var pokemon=Battle.contestants[| argument0[| 0].user];

message(pokemon.name+" used ");

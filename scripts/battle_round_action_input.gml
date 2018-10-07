/// void battle_round_action_input(params);
// 0: team index

var team=Battle.teams[| argument0[| 0]];
var pokemon=Battle.contestants[| argument0[| 0]];

// continue: inside these scripts
script_execute(team.owner.battle_input_script, team, pokemon);

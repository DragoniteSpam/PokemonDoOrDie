/// void battle_individual_action_set_major_status(params);
// 0: user
// 1. MajorStatus

var params=argument0;

params[| 0].status=params[| 1];
params[| 0].status_turns=1;

battle_advance();

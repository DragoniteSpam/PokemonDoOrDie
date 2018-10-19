/// void battle_round_action_anim_retract_trainer(params);
// 0: drawable index

var pawn=Battle.teams[| argument0[| 0]].owner;
var contestant=Battle.contestants[| argument0[| 0]];
var index=ds_list_find_index(pawn.party, contestant);

ds_list_swap(pawn.party, index, Battle.replacements[| argument0[| 0]]);

Battle.contestants[| argument0[| 0]]=pawn.party[| index];
pawn.party[| index].position=argument0[| 0];
Battle.replacements[| argument0[| 0]]=noone;

battle_advance();

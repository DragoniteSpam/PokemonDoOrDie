/// void battle_round_action_send_in_leads(params);
// 0: team index

var team=Battle.teams[| argument0[| 0]];

message(team.name+" sent out "+team.owner.party[| 0].name+"!");
Battle.contestants[| argument0[| 0]]=team.owner.party[| 0];
// this is so each BattlePokemon knows where they are on the field
team.owner.party[| 0].position=argument0[| 0];

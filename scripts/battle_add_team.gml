/// void battle_add_team(Pawn);

var team=instance_create(0, 0, BattleTeam);
team.owner=argument0;
team.name=team.owner.name+"'s Team";

ds_list_add(Battle.teams, team);
ds_list_add(Battle.contestants, noone);

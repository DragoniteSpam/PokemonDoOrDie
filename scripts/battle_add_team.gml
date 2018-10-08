/// void battle_add_team(Pawn, x, y, direction, sprite side, offscreen distance, fade tiem);

var team=instance_create(0, 0, BattleTeam);
team.owner=argument0;
team.name=team.owner.name+"'s Team";
team.sprite_side=argument4;

team.drawable=instance_create(argument1, argument2, BattleDrawable);
team.drawable.sprite_index=argument0.battle_sprite;
// this is so it knows which way to animate
team.drawable.direction=argument3;
// this is the position in the world where the battler is positioned
team.drawable.battle_x=argument1;
team.drawable.battle_y=argument2;
// this is where trainers and pokémon slide in and out from
team.drawable.distance=argument5;
team.drawable.offscreen_x=argument1+team.drawable.distance*dcos(argument3+90);
team.drawable.offscreen_y=argument2-team.drawable.distance*dsin(argument3+90);
// it's more important for opponents to fade in and out than the player
team.drawable.fade_time=argument6;

ds_list_add(Battle.teams, team);
ds_list_add(Battle.contestants, noone);

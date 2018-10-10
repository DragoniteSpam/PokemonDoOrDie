/// BattleTeam battle_add_team(Pawn, SpriteSide);

with (instance_create(0, 0, BattleTeam)){
    owner=argument0;
    name=owner.name+"'s Team";
    sprite_side=argument1;
    
    argument0.team=id;
    
    return id;
}

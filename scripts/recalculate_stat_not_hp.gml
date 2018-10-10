/// int recalculate_stat_hp(pkmn);

var base=get_pokemon(argument0.species).st_hp;
var iv=pkmn.ivs[Stats.HP];
var ev=pkmn.evs[Stats.HP];

return floor(((base+iv)*2+floor(ev/4))*100/level)+level+10;

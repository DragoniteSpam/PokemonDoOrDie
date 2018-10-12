/// int recalculate_stat(pkmn, stat);

var base=get_pokemon(argument0.species).base_stat[argument1];
var iv=argument0.ivs[argument1];
var ev=argument0.evs[argument1];
var level=get_level(argument0.experience, get_pokemon(argument0.species).growth_rate);

if (argument1==Stats.HP){
    return floor(((base+iv)*2+floor(ev/4))*100/level)+level+10;
}

return floor((floor(((base+iv)*2+floor(ev/4))*100/level)+5)*get_nature_modifier(argument0.nature, argument1));

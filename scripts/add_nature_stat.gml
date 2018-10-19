/// DataMove add_nature_stat(name, [stat raised], [stat lowered]);
// Makes it easier to write code to add natures because you only have to
// specify the altered stats and not all of them

var stat_mods=array_create(Stats.SPEED);
array_clear(stat_mods, 1);

switch (argument_count){
    case 3:
        stat_mods[argument[1]]=1.1;
        stat_mods[argument[2]]=0.9;
    default:
        break;
}

return add_nature(argument[0], stat_mods[Stats.HP], stat_mods[Stats.ATTACK], stat_mods[Stats.DEFENSE],
    stat_mods[Stats.SPATTACK], stat_mods[Stats.SPDEFENSE], stat_mods[Stats.SPEED]);

/// int battle_damage(move, user, target, critical?);

// todo sort these out
var mod_targets=1;
var mod_weather=1;
var mod_badge=1;
var mod_critical=1;
var mod_random=random_range(0.85, 1);
var mod_stab=1;
var mod_burn=1;
var mod_other=1;

// todo abilities such as Huge Power, Rivalry, etc

if (argument3){
    // todo sniper increases critical hit damage, and maybe some other things
    mod_critical=2;
}

var offense, defense, offense_mod, defense_mod;
switch (move.category){
    case MoveCategories.PHYSICAL:
        offense=user.act_attack;
        defense=target.act_defense;
        offense_mod=math_attack(user);
        defense_mod=math_defense(target);
        if (user.status=MajorStatus.BURN){
            mod_burn=0.5;
        }
        break;
    case MoveCategories.SPECIAL:
        offense=user.act_sp_attack;
        defense=target.act_sp_defense;
        offense_mod=math_sp_attack(user);
        defense_mod=math_sp_defense(target);
        break;
    case MoveCategories.PHYSICAL_ATK_SPECIAL_DEF:
        offense=user.act_attack;
        defense=target.act_sp_defense;
        offense_mod=math_attack(user);
        defense_mod=math_sp_defense(target);
        if (user.status=MajorStatus.BURN){
            mod_burn=0.5;
        }
        break;
    case MoveCategories.SPECIAL_ATK_PHYSICAL_DEF:
        offense=user.act_sp_attack;
        defense=target.act_defense;
        offense_mod=math_sp_attack(user);
        defense_mod=math_defense(target);
        break;
    case MoveCategories.STATUS:
        show_error("you somehow managed to do a damage calculation on a status move, good job", true);
        break;
}

var m=offense_mod/defense_mod*mod_weather*mod_badge*mod_critical*mod_random*mod_stab*mod_burn*mod_other;

var base=(((2*get_level(argument1))/5+2)*move.value*offense/defense)/50+2;

return floor(base*m);

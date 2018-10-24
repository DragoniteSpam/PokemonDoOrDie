/// void babl_contact_paralyze_user(user, target, ability, move);

var ability=argument2;
var move=argument3;

if (random(100)<World.settings.battle.ability_contact_chance){
    bia_apply_major_status(individual_actions, argument1, argument0, MajorStatus.PARALYZE, 1, noone);
}

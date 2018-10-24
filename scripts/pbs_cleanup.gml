/*
 * Move PBS don't store animation data, and the Essentials animation data
 * wouldn't be of much use to 3D Game Maker anyhow, so we have to attach
 * everything on our own.
 */
var m;

m=get_move(get_move_from_name("METALCLAW", true));
m.animation=ba_move_claw;
m.animation_blending_color=c_silver;

/*
 * Update: I really don't enjoy animating moves. I'll do it later if anything
 * becomes of this project. For now everything besides Metal Claw will use
 * ba_move_basic.
 */

var a;
a=get_ability(get_ability_from_name("STATIC", true));
a.on_contact=babl_contact_paralyze_user;

a=get_ability(get_ability_from_name("INNERFOCUS", true));
a.can_flinch=false;

a=get_ability(get_ability_from_name("SYNCHRONIZE", true));
array_clear(a.status_acceptance, StatusAcceptance.MIRROR);
// syncronize doesn't affect minor status. you can make it do that if you
// want, though.

a=get_ability(get_ability_from_name("MAGNETPULL", true));
a.can_escape=babl_trap_steel;

a=get_ability(get_ability_from_name("LEVITATE", true));
a.damage_from[Types.GROUND]=0;

a=get_ability(get_ability_from_name("BLAZE", true));
a.low_health_factor[Types.FIRE]=World.settings.battle.ability_low_health_move_power;
a=get_ability(get_ability_from_name("OVERGROW", true));
a.low_health_factor[Types.GRASS]=World.settings.battle.ability_low_health_move_power;

a=get_ability(get_ability_from_name("INTIMIDATE", true));
a.on_entry=babl_enter_intimidate;

/// void battle_individual_action_exp_gain(BattleIndividualAction);
// 0: user
// 1. old level
// 2: new level

var params=argument0;
var pkmn=params[| 0];

// todo: ding-ding-ding sound that plays when you learn a new move or
// gain a level

Battle.input_stage=BattleInputStages.LEVEL_STAT_DELTA;
Battle.misc_data[? "who"]=params[| 0];
Battle.misc_data[? "old level"]=params[| 1];
Battle.misc_data[? "new level"]=params[| 2];
// automatically jump to the highest-available level
var delta_hp=pkmn.act_hp_max-pkmn.act_hp_current;
params[| 0].experience=get_experience(params[| 2], get_pokemon(pkmn.species).growth_rate);
recalculate_all_stats(pkmn);
pkmn.act_hp_current=pkmn.act_hp_max-delta_hp;

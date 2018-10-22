/// void battle_round_post_trap_damage(params);
// 0: position

var pkmn=Battle.contestants[| argument0[| 0]];
var trapper=Battle.contestants[| pkmn.trapped_by];
var amount=pkmn.trapped_residual_damage*pkmn.act[Stats.HP];
// todo Wonder Guard
ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_scroll_health, pkmn, amount));
ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_text, pkmn.name+" was hurt by "+pkmn.owner.name+"'s "+trapper.name+"!"));

battle_round_action_execute_faint_check(trapper, pkmn, amount);

battle_advance();

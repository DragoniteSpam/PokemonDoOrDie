/// void battle_round_action_entry_abilities(params);
// 0: contestant index

script_execute(Battle.contestants[| argument0[| 0]].ability.on_entry, individual_actions, Battle.contestants[| argument0[| 0]]);

battle_advance();

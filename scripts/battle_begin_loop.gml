stage=BattleStages.LOOP;
stage_loop=BattleLoopStages.CHOOSE_MOVE;

ds_queue_enqueue(actions, battle_action_check_contestants);
ds_queue_enqueue(actions, battle_action_input);
ds_queue_enqueue(actions, battle_action_execute);

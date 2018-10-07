stage=BattleStages.BEGIN;

ds_queue_enqueue(actions, battle_action_send_in_leads);

message("The battle has started!");

// control returns to the ui prompt

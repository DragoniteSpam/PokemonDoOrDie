switch (stage){
    case BattleStages.BEGIN:
        battle_begin_loop();
        break;
    case BattleStages.LOOP:
        battle_begin_end();
        break;
    case BattleStages.END:
        // return to game probably
        break;
}

if (ds_queue_empty(round_actions)){
    battle_begin_action();
} else {
    battle_begin_round_action();
}

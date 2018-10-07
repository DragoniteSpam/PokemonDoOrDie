switch (Battle.stage){
    case BattleStages.BEGIN:
        battle_advance_begin();
        break;
    case BattleStages.LOOP:
        battle_advance_loop();
        break;
    case BattleStages.END:
        battle_advance_end();
        break;
}

switch (Battle.input_stage){
    case BattleInputStages.GRAND:
        battle_input_processing_grand();
        break;
    case BattleInputStages.MOVE:
        battle_input_processing_move();
        break;
    case BattleInputStages.SWITCH:
        break;
    case BattleInputStages.SWITCH_SUMMARY:
        break;
    case BattleInputStages.SWITCH_MOVES:
        break;
    case BattleInputStages.FLEE:
        break;
    case BattleInputStages.LEVEL_STAT_DELTA:
        battle_input_processing_level_stat_delta();
        break;
    case BattleInputStages.LEVEL_STAT_TOTAL:
        battle_input_processing_level_stat_total();
        break;
}

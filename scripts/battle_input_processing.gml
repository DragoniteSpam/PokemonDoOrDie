switch (Battle.input_stage){
    case BattleInputStages.GRAND:
        battle_input_processing_grand();
        break;
    case BattleInputStages.MOVE:
        battle_input_processing_move();
        break;
    case BattleInputStages.SWITCH:
        break;
    case BattleInputStages.FLEE:
        break;
    // on level up
    case BattleInputStages.LEVEL_STAT_DELTA:
        battle_input_processing_level_stat_delta();
        break;
    case BattleInputStages.LEVEL_STAT_TOTAL:
        battle_input_processing_level_stat_total();
        break;
    // switching before your opponent sends something in
    case BattleInputStages.SWITCH_BEFORE_TURN:
        battle_input_processing_switch(battle_input_processing_control_switch_before_turn);
        break;
}

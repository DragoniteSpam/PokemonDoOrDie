switch (Battle.result){
    case BattleStatus.CONTINUE:
        message("congratulations you broke the battle loop");
        break;
    case BattleStatus.WIN:
        message("there is a winner, but we haven't calculated exactly who it is yet");
        break;
    case BattleStatus.DRAW:
        message("the battle ended as a draw (good job)");
        break;
}

enum BattleStatus {
    CONTINUE,
    WIN,
    DRAW,
}

var still_fighting=0;
for (var i=0; i<ds_list_size(Battle.teams); i++){
    if (team_alive(Battle.teams[| i])){
        still_fighting++;
    }
}

switch (still_fighting){
    case 0:
        return BattleStatus.DRAW;
    case 1:
        return BattleStatus.WIN;
    default:
        return BattleStatus.CONTINUE;
}

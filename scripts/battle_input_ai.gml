/// void battle_input_ai(pokemon);

enum TrainerAI {
    MINIMUM=1,
    MEDIUM=32,
    HIGH=48,
    BEST=100
}

var team=argument0.owner.team;

// todo something with this eventually
var can_escape=pokemon_can_escape(argument0);

var evaluate=battle_ai_item(argument0);

if (evaluate==noone){
    evaluate=battle_ai_withdraw(argument0);
}

if (evaluate==noone){
    evaluate=battle_ai_choose_move(argument0);
}

// continue:
battle_debug(team.owner.name+' has chosen the move '+get_move(value).name+' for '+argument0.name);

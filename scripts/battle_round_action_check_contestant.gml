/// void battle_round_action_check_contestant(params);
// 0: team index

var team=Battle.teams[| argument0[| 0]];
var found=noone;

// todo this is going to get more complicated when you bring ai into it.
// this is going to get even MORE complicated when you bring Zoroark into it,
// because you have to "fool" the text below into thinking "found" is not
// a Zoroark.

for (var i=0; i<ds_list_size(team.owner.party); i++){
    if (alive(team.owner.party[| i])){
        found=team.owner.party[| i];
        break;
    }
}

var pawn_alive=0;
var pawn_slots=0;
// count the number of spaces on the battlefield the battle pawn has
for (var i=0; i<ds_list_size(Battle.teams); i++){
    if (Battle.teams[| i].owner==Camera.battle_pawn){
        pawn_slots++;
    }
}
// count the number of living pokémon the battle pawn has
for (var i=0; i<ds_list_size(Camera.battle_pawn.party); i++){
    if (alive(Camera.battle_pawn.party[| i])){
        pawn_alive++;
    }
}

// continue: in the message()

if (found==noone){
    ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_text, team.name+" has no more healthy Pokémon!"));
} else {
    // if you wanted to do multiplayer (which you do not) you would need to bypass
    // this line. actually if you wanted to do multiplayer, this line would be the
    // least of your worries.
    if (World.settings.battle.battle_style_shift){
        if (pawn_alive>pawn_slots){
            ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_question, team.name+" is about to send out "+found.name+". Would you like to change Pokémon?"));
            the game asks, but nothing happens. you should probably make something happen.
        }
    }
    ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_text, team.name+" sent out "+found.name+"!"));
    Battle.contestants[| argument0[| 0]]=found;
}

battle_advance();

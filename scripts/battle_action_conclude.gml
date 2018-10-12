switch (Battle.result){
    case BattleStatus.CONTINUE:
        message("congratulations you broke the battle loop");
        break;
    case BattleStatus.WIN:
        var fade_time=0.5;
        var victorious=noone;
        var losers=ds_list_create();
        for (var i=0; i<ds_list_size(Battle.teams); i++){
            for (var j=0; j<ds_list_size(Battle.teams[| i].owner.party); j++){
                if (alive(Battle.teams[| i].owner.party[| j])){
                    victorious=Battle.teams[| i].owner;
                    continue;
                }
            }
            if (victorious!=Battle.teams[| i].owner){
                ds_list_add(losers, Battle.teams[| i].owner);
            }
        }
        var loser_names="";
        for (var i=0; i<ds_list_size(losers); i++){
            loser_names=loser_names+losers[| i].name;
            if (i<ds_list_size(losers)-2){
                loser_names=loser_names+", ";
            } else if (i<ds_list_size(losers)-1){
                loser_names=loser_names+" and ";
            }
        }
        ds_queue_enqueue(Battle.round_actions, add_battle_round_action(battle_round_action_text, victorious.name+" has defeated "+loser_names+"!"));
        if (victorious==Camera.battle_pawn){
            var reward=0;
            for (var i=0; i<ds_list_size(losers); i++){
                reward=reward+get_prize_money(losers[| i]);
            }
            ds_queue_enqueue(Battle.round_actions, add_battle_round_action(battle_round_action_text, "Was given $"+string(reward)+" as prize money!"));
            // todo: if not wild pokémon, trainer(s) move back on screen and display their "lose" text
            ds_queue_enqueue(Battle.round_actions, add_battle_round_action(battle_fade, c_black, fade_time, 0));
            ds_queue_enqueue(Battle.round_actions, add_battle_round_action(battle_end, true));
        } else {
            var reward=min(Camera.battle_pawn.money, get_prize_money(Camera.battle_pawn));
            // you can't go into debt, unless you want to implement a hard mode or something
            if (reward>0){
                // i don't like instanceof but the alternative would be writing a lot of code,
                // most of which will probably never be used
                if (instanceof(victorious, PawnWild)){
                    var loss_message=Camera.battle_pawn.name+" dropped $"+string(reward)+" in panic!";
                } else {
                    var loss_message=Camera.battle_pawn.name+" handed out $"+string(reward)+" to the winner!";
                }
                ds_queue_enqueue(Battle.round_actions, add_battle_round_action(battle_round_action_text, loss_message));
                Camera.battle_pawn.money=Camera.battle_pawn.money-reward;
            }
            // todo: if not wild pokémon, trainer(s) move back on screen and display their "win" text
            ds_queue_enqueue(Battle.round_actions, add_battle_round_action(battle_round_action_text, Camera.battle_pawn.name+" zonked out!"));
            ds_queue_enqueue(Battle.round_actions, add_battle_round_action(battle_fade, c_black, fade_time, 0));
            ds_queue_enqueue(Battle.round_actions, add_battle_round_action(battle_end, false));
        }
        break;
    case BattleStatus.DRAW:
        ds_queue_enqueue(Battle.round_actions, add_battle_round_action(battle_round_action_text, "The battle ended in a draw..."));
        break;
}

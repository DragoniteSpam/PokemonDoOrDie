// This checks to see if you decided to switch any of your Pokémon before
// a foe sends in a new Pokémon. Foes can't do this to you, but it would
// theoretically work for them too.

for (var i=0; i<ds_list_size(replacements); i++){
    if (replacements[| i]!=noone){
        var team=Battle.teams[| i];
        var in_battle=Battle.contestants[| i];
        var new_battler=team.owner.party[| Battle.replacements[| i]];
        if (alive(in_battle)){
            // This is the wrong kind of action but we can get away with using it here
            // because it doesn't do anything specific.
            if (team.owner==Camera.battle_pawn){
                ds_queue_enqueue(round_actions, add_battle_round_action(battle_individual_action_text, Battle.contestants[| i].name+", come back!"));
            } else {
                ds_queue_enqueue(round_actions, add_battle_round_action(battle_individual_action_text, team.name+" called back "+Battle.contestants[| i].name+"!"));
            }
            ds_queue_enqueue(round_actions, add_battle_round_action(battle_round_action_anim_retract_pokemon_hud, i));
            ds_queue_enqueue(round_actions, add_battle_round_action(battle_round_action_anim_retract_contestant, i));
            // And again.
            ds_queue_enqueue(round_actions, add_battle_round_action(battle_individual_action_wait, 0.25, true));
        }
        ds_queue_enqueue(round_actions, add_battle_round_action(battle_round_action_change_contestant, i));
        // And again.
        if (team.owner==Camera.battle_pawn){
            ds_queue_enqueue(round_actions, add_battle_round_action(battle_individual_action_text, "Go, "+new_battler.name+"!"));
        } else {
            ds_queue_enqueue(round_actions, add_battle_round_action(battle_individual_action_text, team.name+" sent out "+new_battler.name+"!"));
        }
        ds_queue_enqueue(round_actions, add_battle_round_action(battle_round_action_anim_submit_contestant, i));
        ds_queue_enqueue(round_actions, add_battle_round_action(battle_round_action_anim_send_in_pokemon_hud, i));
    }
}

// This checks to see if you decided to switch any of your Pokémon before
// a foe sends in a new Pokémon. Foes can't do this to you, but it would
// theoretically work for them too.

for (var i=0; i<ds_list_size(replacements); i++){
    if (replacements[| i]!=noone){
        // This is the wrong kind of action but we can get away with using it here
        // because it doesn't do anything specific.
        ds_queue_enqueue(round_actions, add_battle_round_action(battle_individual_action_text, Battle.contestants[| i].name+", come back!"));
        ds_queue_enqueue(round_actions, add_battle_round_action(battle_round_action_anim_retract_contestant, i));
        ds_queue_enqueue(round_actions, add_battle_round_action(battle_round_action_change_contestant, i));
        // And again.
        ds_queue_enqueue(round_actions, add_battle_round_action(battle_individual_action_wait, 0.25, true));
        // And again.
        ds_queue_enqueue(round_actions, add_battle_round_action(battle_individual_action_text, "Go, "+Battle.teams[| i].owner.party[| Battle.replacements[| i]].name+"!"));
        ds_queue_enqueue(round_actions, add_battle_round_action(battle_round_action_anim_submit_contestant, i));
        next make the hp bars retract, anchor onto the right pokémon, and reappear
        after that you should probably make foe switching/replacement work, since 
        that was the goal to begin with
    }
}

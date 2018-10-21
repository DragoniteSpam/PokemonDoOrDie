/// battle_round_action_execute(user, target, damage);
// DO NOT QUEUE THIS. IT DOES NOT RETURN A VALUE. THE GAME WILL PROBABLY CRASH.

if (argument2>=argument1.act_hp){
    var base=get_pokemon(argument0.species);
    ds_queue_enqueue(Battle.individual_actions, add_battle_individual_action(battle_individual_action_death, argument1));
    ds_queue_enqueue(Battle.individual_actions, add_battle_individual_action(battle_round_action_anim_retract_pokemon_hud, argument1.position));
    ds_queue_enqueue(Battle.individual_actions, add_battle_individual_action(battle_individual_action_text, argument1.name+" fainted!"));
    argument1.flag_downed=true;
    // todo: post-death effects, such as aftermath, destiny bond, etc
    // you don't gain experience from taking down teammates, allies or yourself
    if (argument0.owner.object_index==PawnPlayer&&argument0.owner.team!=argument1.owner.team){
        // todo this but for all pokémon involved in the takedown, and whoever holds an exp share,
        // and if the exp all is turned on
        // also you should probably make sure the victorious pokémon(s) are still alive
        var level=get_level(argument0.experience, base.growth_rate);
        if (level<MAX_LEVEL){
            // todo aggregate experience gain, i.e. if two pokémon go down at the same time you only gain
            // experience once
            var exp_gain=exp_reward(argument0, argument1);
            var exp_next_level=get_experience(level+1, base.growth_rate);
            if (exp_gain==1){
                var points="point";
            } else {
                var points="points";
            }
            ds_queue_enqueue(Battle.individual_actions, add_battle_individual_action(battle_individual_action_text, argument0.name+" gained "+string_commas(exp_gain, true)+" experience "+points+"!"));
            var to_grow=min(exp_gain, exp_next_level-argument0.experience);
            ds_queue_enqueue(Battle.individual_actions, add_battle_individual_action(battle_individual_action_exp_gain, argument0, argument0.experience, to_grow));
            if (argument0.experience+exp_gain>=exp_next_level){
                var new_level=get_level(argument0.experience+exp_gain, base.growth_rate);
                ds_queue_enqueue(Battle.individual_actions, add_battle_individual_action(battle_individual_action_text, argument0.name+" grew to level "+string(new_level)+"!"));
                ds_queue_enqueue(Battle.individual_actions, add_battle_individual_action(battle_individual_action_level_gain, argument0, level, new_level));
                if (argument0.experience+exp_gain>exp_next_level){
                    var new_level_exp=get_experience(new_level, base.growth_rate);
                    var remainder=argument0.experience+exp_gain-new_level_exp;
                    ds_queue_enqueue(Battle.individual_actions, add_battle_individual_action(battle_individual_action_exp_gain, argument0, new_level_exp, remainder));
                }
                // todo learning new moves
            }
        }
    } // i don't know what foes gaining experience would look like, but you're free to try it out all the same
} // endif type effectiveness

/// void battle_round_action_execute(params);
// 0: BattleExecutableAction

var exe=argument0[| 0];

var pokemon=exe.user;

if (!pokemon.flag_downed){
    switch (exe.action){
        case BattleActions.MOVE:
            var base=get_pokemon(pokemon.species);
            var move=get_move(exe.value);
            var hit=battle_get_hit(move, pokemon, exe.targets);
            // todo: check for flinches or other conditions which may invalidate the entire turn
            ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_text, pokemon.name+" used "+move.name+"!"));
            // todo: other conditions under which a move may fail
            
            var hit_count=0;
            for (var i=0; i<array_length_1d(hit); i++){
                if (hit[i]){
                    hit_count++;
                }
            }
            
            if (hit_count>0){
                ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_animation_move, pokemon, ds_list_clone(exe.targets), move/*there may be other data that needs to go here at some point but i'm pretty sure it can all be derived from this*/));
            }
            
            // the fact that i need to do basically the same thing twice is upsetting
            for (var i=0; i<array_length_1d(hit); i++){
                // the obvious part: if you're marked as being hit, execute the action, otherwise, ignore it
                if (hit[i]){
                    // the less obvious part: if you're not marked as being already fainted, execute the action, otherwise, ignore it
                    if (!exe.targets[| i].flag_downed){
                        var target_fainted=false;
                        if (move.category!=MoveCategories.STATUS){
                            // todo sort this out (calculating whether a hit is critical or not: remember, some conditions
                            // increase critical hit chances, and others negate them entirely)
                            var matchup=get_matchup_on(move.type, exe.targets[| i]);
                            if (matchup==0){
                                ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_text, "But it doesn't affect "+exe.targets[| i].name));
                            } else {
                                var critical_hit_threshold=1;
                                var critical=irandom(16)<critical_hit_threshold;
                                var damage=battle_damage(move, pokemon, exe.targets[| i], critical);
                                ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_scroll_health, exe.targets[| i], damage));
                                if (array_length_1d(hit)>1){
                                    var matchup_message_postfix=" on "+exe.targets[| i];
                                } else {
                                    var matchup_message_postfix="";
                                }
                                if (matchup>1){
                                    // this could be compacted a little but that would make potential localization a little bit tricky
                                    if (array_length_1d(hit)>1){
                                        var matchup_message="It's super effective on "+exe.targets[| i]+"!";
                                    } else {
                                        var matchup_message="It's super effective!";
                                    }
                                    ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_text, matchup_message));
                                } else if (matchup<1){
                                    // this could be compacted a little but that would make potential localization a little bit tricky
                                    if (array_length_1d(hit)>1){
                                        var matchup_message="It's not very effective on "+exe.targets[| i]+"...";
                                    } else {
                                        var matchup_message="It's not very effective...";
                                    }
                                    ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_text, matchup_message));
                                }
                                if (critical){
                                    if (array_length_1d(hit)>1){
                                        var critical_message="A critical hit on "+exe.targets[| i].name+"!";
                                    } else {
                                        var critical_message="A critical hit!";
                                    }
                                    ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_text, critical_message));
                                }
                                if (damage>=exe.targets[| i].act_hp){
                                    ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_death, exe.targets[| i]));
                                    ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_round_action_anim_send_out_pokemon_hud, exe.targets[| i].position));
                                    ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_text, exe.targets[| i].name+" fainted!"));
                                    target_fainted=true;
                                    exe.targets[| i].flag_downed=true;
                                    // todo: post-death effects, such as aftermath, destiny bond, etc
                                    if (pokemon.owner.object_index==PawnPlayer){
                                        // todo this but for all pokémon involved in the takedown, and whoever holds an exp share,
                                        // and if the exp all is turned on
                                        // also you should probably make sure the victorious pokémon(s) are still alive
                                        var level=get_level(pokemon.experience, base.growth_rate);
                                        if (level<MAX_LEVEL){
                                            // todo aggregate experience gain, i.e. if two pokémon go down at the same time you only gain
                                            // experience once
                                            var exp_gain=exp_reward(pokemon, exe.targets[| i]);
                                            var exp_next_level=get_experience(level+1, base.growth_rate);
                                            if (exp_gain==1){
                                                var points="point";
                                            } else {
                                                var points="points";
                                            }
                                            ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_text, pokemon.name+" gained "+string_commas(exp_gain, true)+" experience "+points+"!"));
                                            var to_grow=min(exp_gain, exp_next_level-pokemon.experience);
                                            ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_exp_gain, pokemon, pokemon.experience, to_grow));
                                            if (pokemon.experience+exp_gain>=exp_next_level){
                                                var new_level=get_level(pokemon.experience+exp_gain, base.growth_rate);
                                                ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_text, pokemon.name+" grew to level "+string(new_level)+"!"));
                                                ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_level_gain, pokemon, level, new_level));
                                                if (pokemon.experience+exp_gain>exp_next_level){
                                                    var new_level_exp=get_experience(new_level, base.growth_rate);
                                                    var remainder=pokemon.experience+exp_gain-new_level_exp;
                                                    ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_exp_gain, pokemon, new_level_exp, remainder));
                                                }
                                                // todo learning new moves
                                            }
                                        }
                                    } // i don't know what foes gaining experience would look like, but you're free to try it out all the same
                                } // endif type effectiveness
                            }
                        }
                        if (!target_fainted){
                            for (var j=0; j<ds_list_size(move.effects); j++){
                                if (irandom(100)<=move.effect_odds[| j]){
                                    script_execute(move.effects[| j], pokemon, exe.targets[| i]);
                                }
                            }
                        }
                    }
                } else {
                    ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_text, exe.targets[| i].name+" avoided the attack!"));
                }
            }
            break;
        case BattleActions.ITEM:
            ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_text, pokemon.name+" used a(n) "+World.all_items[exe.value].name+"!"));
            break;
        case BattleActions.SWITCH:
            ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_text, pokemon.name+" switched to "+exe.value.name+"!"));
            break;
        case BattleActions.FLEE:
            ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_text, pokemon.name+" fled!"));
            break;
        case BattleActions.IDLE:
            ds_queue_enqueue(individual_actions, add_battle_individual_action(battle_individual_action_text, pokemon.name+" is just hanging around!"));
            break;
    }
}

with (exe){
    instance_destroy();
}

// continue:
battle_advance();

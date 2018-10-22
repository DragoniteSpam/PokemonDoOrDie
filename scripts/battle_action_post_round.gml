/*
 * if you want the order of events to go like
 *
 * 1. you trap damage
 * 2. foe trap damage
 * 3. you poison damage
 * 4. foe poison damage
 *
 * then you'll have to separate the for loops. in this case it doesn't
 * really matter because if you both die to post-round effects it's going
 * to be counted as a draw regardless of the order that it happens in,
 * but i don't remember if that's how the rules of actual pokémon go.
 */

// trapping moves (whirlpool, fire spin, etc)
for (var i=0; i<ds_list_size(contestants); i++){
    if (contestants[| i]!=noone){
        ds_queue_enqueue(round_actions, add_battle_round_action(battle_round_post_trap_damage, i));
        ds_queue_enqueue(round_actions, add_battle_round_action(battle_round_post_major_status_damage, i));
    }
}
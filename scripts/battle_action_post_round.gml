for (var i=0; i<ds_list_size(contestants); i++){
    if (contestants[| i]!=noone){
        if (contestants[| i].trapped_residual_damage>0&&contestants[| i].trapped_by!=-1){
            ds_queue_enqueue(round_actions, add_battle_round_action(battle_round_post_trap_damage, i));
        }
    }
}

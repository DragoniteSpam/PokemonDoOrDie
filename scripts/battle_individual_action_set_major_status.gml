/// void battle_individual_action_set_major_status(params);
// 0: user
// 1: MajorStatus
// 2: [status turn]

var params=argument0;

params[| 0].status=params[| 1];
if (ds_list_size(params)>2){
    params[| 0].status_turn=params[| 2];
}

battle_advance();

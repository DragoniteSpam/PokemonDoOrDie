/// void be_user_speed_raise_1(user, target, move id);

var target=argument1;

with (instance_create(0, 0, BattleAppliedEffect)){
    bia_apply_speed_raise_1(scheduled_actions, argument0, argument0, get_move(argument2));
    
    return id;
}

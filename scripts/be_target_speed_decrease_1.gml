/// void be_target_speed_decrease_1(user, target, move id);

with (instance_create(0, 0, BattleAppliedEffect)){
    bia_apply_speed_decrease_1(scheduled_actions, argument0, argument1, get_move(argument2));
    cancel_if_target_fainted=true;
    
    return id;
}

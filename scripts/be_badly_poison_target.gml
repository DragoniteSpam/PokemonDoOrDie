/// void be_badly_poison_target(user, target, move id);

with (instance_create(0, 0, BattleAppliedEffect)){
    bia_apply_major_status(scheduled_actions, argument0, argument1, MajorStatus.TOXIC, 1, get_move(argument2));
    
    return id;
}

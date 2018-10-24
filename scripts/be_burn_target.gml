/// void be_burn_target(user, target, move id);

with (instance_create(0, 0, BattleAppliedEffect)){
    bia_apply_major_status(individual_actions, argument1, argument0, MajorStatus.BURN, 1, get_move(argument2));
    
    return id;
}

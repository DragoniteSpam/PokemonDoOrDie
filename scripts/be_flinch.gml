/// void be_flinch(user, target, move id);

with (instance_create(0, 0, BattleAppliedEffect)){
    bia_apply_flinch(scheduled_actions, argument0, argument1, get_move(argument2));
    
    return id;
}

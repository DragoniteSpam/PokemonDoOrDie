/// void be_confuse(user, target, move id);

with (instance_create(0, 0, BattleAppliedEffect)){
    if (argument1.confused==0){
        bia_apply_confusion(scheduled_actions, argument0, argument1, irandom_range(World.settings.battle.confuse_min_turns, World.settings.battle.confuse_max_turns), get_move(argument2));
    }
    
    return id;
}

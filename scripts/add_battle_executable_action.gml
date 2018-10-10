/// BattleExecutableAction add_battle_executable_action(action, user, target type, target, value);

with (instance_create(0, 0, BattleExecutableAction)){
    action=argument0;
    user=argument1;
    target_type=argument2;
    targets=argument3;
    value=argument4;
    
    return id;
}

/// BattleExecutableAction add_battle_executable_action(action, user, target, value);

with (instance_create(0, 0, BattleExecutableAction)){
    action=argument0;
    user=argument1;
    target=argument2;
    value=argument3;
    
    return id;
}

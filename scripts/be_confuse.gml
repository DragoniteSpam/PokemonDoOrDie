/// void be_confuse(user, target, move id);

var user=argument0;     // unused here
var move=argument2;     // unused here

with (instance_create(0, 0, BattleAppliedEffect)){
    if (argument1.confused==0){
        argument1.confused=irandom_range(World.settings.battle.confuse_min_turns, World.settings.battle.confuse_max_turns);
        ds_queue_enqueue(actions, add_battle_individual_action(battle_individual_action_text, argument1.name+" became confused!"));
    }
    
    return id;
}

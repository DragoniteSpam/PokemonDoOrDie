/// void be_trap_infinite_turns(user, target, move id);

var move=argument2;     // unused here

with (instance_create(0, 0, BattleAppliedEffect)){
    if (argument1.trapped_by==-1){
        argument1.trapped_by=argument0.position;
        argument1.trapped_for=MILLION;  // your computer will fail long before you manage to have a battle drag out for this long, even if you put it on autopilot
        argument1.trapped_residual_damage=0;    // if you want to make a version that also does residual damage, clone this script and name it such
        ds_queue_enqueue(scheduled_actions, add_battle_individual_action(battle_individual_action_text, argument1.name+" was trapped by "+argument0.name+"!"));
        cancel_if_target_fainted=true;
    }
    
    return id;
}

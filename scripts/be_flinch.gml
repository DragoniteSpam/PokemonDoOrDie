/// void be_flinch(user, target, move id);

var user=argument0;     // unused here
var move=argument2;     // unused here

with (instance_create(0, 0, BattleAppliedEffect)){
    if (!argument1.flinch){
        argument1.flinch=true;
    }
    
    return id;
}

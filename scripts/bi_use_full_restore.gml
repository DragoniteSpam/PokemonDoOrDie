/// BattleExecutableAction bi_use_full_restore(user, item);

var user=argument0;
var item=argument1;

// you could check for the need to heal confusion, infatuation
// and any other minor statuses you may wish to add, if you want
if (user.act_hp==user.act[Stats.HP]&&user.status==MajorStatus.NONE){
    message(user.name+" is pretty healthy already!");
    return noone;
}

return add_battle_executable_action(BattleActions.ITEM, user, BattleTargets.SELF, noone, item);

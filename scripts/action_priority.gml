/// double action_priority(BattleExecutableAction);
/* Components:
 *   - whole number: move/action priority
 *   - fractional part: speed
 */

var n=0;
var f=0;

switch (argument0.action){
    case BattleActions.MOVE:
        n=World.all_moves[argument0.value];
        break;
    case BattleActions.SWITCH:
        n=20;
        break;
    case BattleActions.ITEM:
        n=21;
        break;
    case BattleActions.FLEE:
        n=22;
        break;
}

f=math_speed(argument0.user);

return n+f;

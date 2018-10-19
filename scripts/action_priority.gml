/// double action_priority(BattleExecutableAction);
/* Components:
 *   - whole number: move/action priority
 *   - fractional part: speed
 */

var n=0;
var f=0;

switch (argument0.action){
    case BattleActions.IDLE:
        return 0;
    case BattleActions.MOVE:
        n=get_move(argument0.value).priority;
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
    case BattleActions.AUTOKO:
        return 23;
        break;
    case BattleActions.AUTOVICTORY:
        return 24;
        break;
}

// add a random amount of floating point between -0.25 and 0.25 to account for speed ties
// the range of possible numerical speeds is about between 1 and 3,000, so dividing the
// result by 10,000 should be a pretty safe way to "normalize" it to a decimal
f=(math_mod(argument0.user, Stats.SPEED)+random_range(-0.25, 0.25))/10000;

return n+f;

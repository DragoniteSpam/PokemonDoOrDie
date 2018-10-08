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

// add a random amount of floating point between -0.25 and 0.25 to account for speed ties
// the range of possible numerical speeds is about between 1 and 3,000, so dividing the
// result by 10,000 should be a pretty safe way to "normalize" it to a decimal
f=(math_speed(argument0.user)+random_range(-0.25, 0.25))/10000;

return n+f;

/// array battle_get_hit(move, user, targets);

// this may not be useful but it's good information to have i guess
var move=argument0;
var user=argument1;
var output=array_create(ds_list_size(argument2));

if (move.accuracy==0){
    for (var i=0; i<ds_list_size(argument2); i++){
        // todo fly, dig, dive
        output[i]=true;
    }
} else {
    for (var i=0; i<ds_list_size(argument2); i++){
        // todo fly, dig, dive
        var roll=random_range(0, 100)*math_mod(argument1, Stats.ACCURACY)/math_mod(argument2[| i], Stats.EVADE);
        if (roll<move.accuracy){
            output[i]=true;
        } else {
            output[i]=false;
        }
    }
}

return output;

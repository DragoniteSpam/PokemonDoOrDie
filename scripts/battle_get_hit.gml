/// array battle_get_hit(move, user, target);

var output=array_create(ds_list_size(argument2));

if (move.accuracy==0){
    for (var i=0; i<ds_list_size(argument2); i++){
        // todo fly, dig, dive
        output[i]=true;
    }
} else {
    for (var i=0; i<ds_list_size(argument2); i++){
        // todo fly, dig, dive
        var roll=random_range(0, 100)*math_accuracy(argument1)/math_evade(argument2[| i]);
        if (roll<move.accuracy){
            output[i]=true;
        } else {
            output[i]=false;
        }
    }
}

return output;

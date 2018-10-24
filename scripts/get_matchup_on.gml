/// double get_matchup_on(type, BattlePokemon, [applied effects list]);

// todo this may become important for some effects that mess with
// type, i.e. Flying Press and whatever
if (argument_count==3){
    var effects_list=argument[2];
}

var m=argument[1].ability.damage_from[argument[0]];;

for (var i=0; i<ds_list_size(argument[1].types); i++){
    m=m*get_matchup(argument[0], argument[1].types[| i]);
}

return m;

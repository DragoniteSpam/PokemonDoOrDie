/// double get_matchup(type, BattlePokemon);

var m=1;

for (var i=0; i<ds_list_size(argument1.type); i++){
    m=m*get_matchup(argument0, argument1.type[| i]);
}

return m;

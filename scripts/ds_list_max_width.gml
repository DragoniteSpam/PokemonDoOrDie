/// double ds_list_max_width(list);
// this depends on having the correct font set. be careful.

var winner=0;

for (var i=0; i<ds_list_size(argument0); i++){
    winner=max(winner, string_width(string(argument0[| i])));
}

return winner;

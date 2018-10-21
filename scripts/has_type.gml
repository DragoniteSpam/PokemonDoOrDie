/// boolean has_type(type, BattlePokemon);

for (var i=0; i<ds_list_size(argument[1].types); i++){
    if (argument[1].types[i]==argument[0]){
        return true;
    }
}

return false;

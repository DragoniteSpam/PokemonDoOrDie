/// void pawn_add_pokemon(pawn, species, level, [name], [moves]);

var base=get_pokemon(argument[1]);

var pkmn=instance_create(0, 0, BattlePokemon);
pkmn.name=base.name;
pkmn.owner=argument[0];
pkmn.species=argument[1];
pkmn.experience=get_experience(argument[2], base.growth_rate);

switch (argument_count){
    case 5:
        var moves=argument[4];
        for (var i=0; i<min(array_length_1d(moves), MOVE_LIMIT); i++){
            pkmn.moves[i]=moves[i];
        }
    case 4:
        //pkmn.name=base.name;
        pkmn.name=argument[3];
        break;
}

pokemon_auto_moves(pkmn);

ds_list_add(argument[0].party, pkmn);

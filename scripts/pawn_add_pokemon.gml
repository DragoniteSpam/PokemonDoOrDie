/// void pawn_add_pokemon(pawn, species, [name]);

var base=get_pokemon(argument[1]);

var pkmn=instance_create(0, 0, BattlePokemon);
pkmn.owner=argument[0];
pkmn.species=argument[1];
pkmn.name=base.name;

switch (argument_count){
    case 3:
        //pkmn.name=base.name;
        pkmn.name=argument[2];
        break;
}

pokemon_auto_moves(pkmn);

ds_list_add(argument[0].party, pkmn);

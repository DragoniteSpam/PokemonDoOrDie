/// void pawn_add_pokemon(pawn, species);

var base=World.all_pokemon[argument1];

var pkmn=instance_create(0, 0, BattlePokemon);
pkmn.species=argument1;
pkmn.name=base.name;

pkmn.moves[0]=0;

ds_list_add(argument0.party, pkmn);

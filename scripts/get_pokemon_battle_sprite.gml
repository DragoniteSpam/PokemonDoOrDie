/// sprite get_pokemon_battle_sprite(species, side);

enum SpriteSides {
    FRONT,
    BACK
}

switch (argument1){
    case SpriteSides.FRONT:
        return get_pokemon(argument0).spr_front;
    case SpriteSides.BACK:
        return get_pokemon(argument0).spr_back;
}

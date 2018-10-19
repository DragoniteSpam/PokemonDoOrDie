/// sprite get_pokemon_sprite_hash_f(species, side);

enum SpriteSides {
    FRONT,
    BACK
}

// todo stuff here based on gender, shiny, form and maybe a few other things

switch (argument1){
    case SpriteSides.FRONT:
        return spr_front;
    case SpriteSides.BACK:
        return spr_back;
}

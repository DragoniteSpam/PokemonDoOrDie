/// sprite get_pokemon_sprite_hash(BattlePokemon, side);

// todo stuff here based on gender, shiny, form and maybe a few other things

var name=string_pad(argument0.species+1, 3);
if (argument0.gender==Genders.FEMALE){
    name=name+"f";
}
if (argument0.shiny){
    name=name+"s";
}
if (argument1==SpriteSides.BACK){
    name=name+"b";
}

if (argument0.form>0){
    name=name+"_"+string(argument0.form);
}

return name;

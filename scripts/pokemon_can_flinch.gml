/// boolean pokemon_can_flinch(BattlePokemon);

// i'm pretty sure Inner Focus is the only way to block flinching, but
// if you add more (items, etc), you should apply them here

if (!argument0.ability.can_flinch){
    return false;
}

return true;

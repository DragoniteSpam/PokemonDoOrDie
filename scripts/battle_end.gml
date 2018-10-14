/// void battle_end(params);
// 0: true if the outcome is favoriable, false if it is not

var params=argument0;

// continue: ideally the game returns control to the overworld after this
// is finished executing

// for now we just end the game
show_message("That's the battle loop! Hopefully at some point in the future there will be an overworld to return to or something. For now the game is just going to close.");
game_end();

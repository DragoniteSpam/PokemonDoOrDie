# PokemonDoOrDie
I need to make better life choices. I need to make better life choices. I need to make better life choices.

**Update: as of 9 May 2019, this project is now being worked on in Game Maker Studio 2. You can find the new repository [here](https://github.com/DragoniteSpam/DDDGameGMS2). I've also decided to start reducing the emphasis on Pokémon, for several different reasons, and I'm currently doing something else in a private repository but it should be functional if you want it.**

I can't grab embedded gifs from Twitter and I don't feel like copying them to imgur, but here are some screenshots.

[Battle opening](https://twitter.com/DragoniteSpam/status/1049182378122510341)

[Status effects](https://twitter.com/DragoniteSpam/status/1050539405348352000)

[Turn switching](https://twitter.com/DragoniteSpam/status/1053545162742337536)

[Abilities](https://twitter.com/DragoniteSpam/status/1055524452702842881)

[AI fighting itself](https://www.youtube.com/watch?v=n-586jZ3V2c)

[Basic overworld](https://twitter.com/DragoniteSpam/status/1065035965956321281)

Editor and game in action: [30 March 2019](https://www.youtube.com/watch?v=nLtFmBxOASs), [13 April 2019](https://www.youtube.com/watch?v=cQf_j-vvPCM)

I'll probably add more eventually.

# Known Issues

 - **Semi-transparency in 3D space** - if you try to draw surface underneath an existing semi-transparent surface, it won't work. This is a Game Maker-wide problem and I'll probably either deal with depth sorting later, or just get rid of semi-transparent textures.

# Credits
 - I ~~stole~~ re-interpreted a lot of AI code from Pokémon Essentials from RPG Maker XP. Whoever wrote that is a big help.
 
 - PBS files also came from Pokémon Essentials, because nobody in their right mind would recompile all that data on their own.
 
 - Battler sprites came from, you guessed it, Pokémon Essentials. Where would I be without these guys. Making original games, probably.
 
 - I'm pretty sure everything that doesn't fall into the first three categories was written by me, so all of the code except the ~1000 lines in the "standard ai" folder.

/// void battle_input_processing_switch(battle input processing script);

var pkmn=Battle.input_processing;

var text_list=ds_list_create();

for (var i=0; i<ds_list_size(Camera.battle_pawn.party); i++){
    ds_list_add(text_list, Camera.battle_pawn.party[| i].name);
}
ds_list_add(text_list, "Back");

var max_n=ds_list_size(text_list);

draw_menu_from_list(text_list, Battle.input_index);
Battle.input_index=menu_input(Battle.input_index, max_n);

if (Battle.input_index<max_n-1){
    // todo draw the summary screen, preferably with stats and moves
    // visible at the same time, but if that's not an option, a key to
    // toggle between them
}
 
// controls may be variable depending on what part of the battle is
// having you switch, so we package that up in a script and pass it
// as an argument   
script_execute(argument0);

ds_list_destroy(text_list);


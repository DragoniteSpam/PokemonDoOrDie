/// void draw_pause_main();

draw_set_font(FGameMedium);
draw_set_colour(c_black);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

var text=array_compose("Party", "Items", "Encyclopedia", "Save", "Settings", "Back to Game", "Quit");
var n=array_length_1d(text);

draw_rectangle_9s(spr_window9s_hgss, UI_MENU_START_X, UI_MENU_START_Y, UI_MENU_WIDTH, (n+2)*UI_MENU_SLOT_HEIGHT);

for (var i=0; i<n; i++){
    draw_text(UI_MENU_START_X+48, UI_MENU_START_Y+(i+1.5)*UI_MENU_SLOT_HEIGHT, text[i]);
}

draw_cursor(UI_MENU_START_X+32, UI_MENU_START_Y+(Pause.cursor_main_index+1.5)*UI_MENU_SLOT_HEIGHT);

// todo play sound?
if (Controller.press_up){
    Pause.cursor_main_index=(--Pause.cursor_main_index+n)%n;
} else if (Controller.press_down){
    Pause.cursor_main_index=++Pause.cursor_main_index%n;
} else if (Controller.press_left){
    Pause.cursor_main_index=0;
} else if (Controller.press_right){
    Pause.cursor_main_index=n-1;
}

debug(Pause.cursor_main_index)

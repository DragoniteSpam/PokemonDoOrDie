/// void draw_menu_from_list(list, selected index);
// this only draws the list, it does not control it. you most
// likely want to use menu_input in conjunction with this.

var max_n=ds_list_size(argument0);

if (max_n==2){
//    var text_font=FPokemonLarge;
    var text_font=FPokemonMediumLarge;
} else if (max_n==3){
//    var text_font=FPokemonMediumLarge;
    var text_font=FPokemonMedium;
} else {
    var text_font=FPokemonMedium;
}
draw_set_font(text_font);

var max_width=ds_list_max_width(argument0);

var text_spacing=font_get_size(text_font)*1.5;

var box_width=max_width+2*UI_TEXT_BOX_OFFSET_W+text_spacing*2;  // the bigger the font, the more horizontal buffer the text box will have, as well
var box_height=text_spacing*(max_n+2);
var box_x=room_width-box_width;
var box_y=room_height-box_height;

draw_rectangle_9s(spr_window9s_hgss, box_x, box_y, box_width, box_height);

draw_set_valign(fa_middle);

for (var i=0; i<max_n; i++){
    draw_text(box_x+text_spacing+UI_TEXT_BOX_OFFSET_W, box_y+text_spacing*(i+1.5), argument0[| i]);
}

if (argument1>=0){
    draw_selection_arrow(box_x+UI_TEXT_BOX_OFFSET_W+text_spacing/3, box_y+text_spacing*(argument1+1.5));
}

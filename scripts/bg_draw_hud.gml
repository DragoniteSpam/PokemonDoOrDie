/// void BattleHUD.bg_draw_hud();

if (user!=noone){
    var base=get_pokemon(user.species);
    var level=get_level(user.experience, base.growth_rate);
    var bar_height=16;
    var exp_bar_height=12;
    var text_y=y+32;
    var hp_bar_y=text_y+24;
    var hp_text_y=hp_bar_y+24;
    var exp_bar_y=hp_text_y+28;
    
    // foes/not player pawns have slightly smaller status boxes
    if (user.owner==Camera.battle_pawn){
        var offset=0;
    } else {
        var offset=40;
    }
    
    draw_set_valign(fa_middle);
    
    // text row
    draw_rectangle_9s(spr_window9s_hgss, x, y, UI_BATTLE_HUD_WIDTH, UI_BATTLE_HUD_HEIGHT-offset);
    draw_text(x+32, text_y, user.name);
    
    var level_string="Lv. "+string(level);
    
    draw_sprite(spr_gender, user.gender, x+UI_BATTLE_HUD_WIDTH-32-32-string_width(level_string), text_y);
    
    draw_set_halign(fa_right);
    draw_text(x+UI_BATTLE_HUD_WIDTH-32, text_y, level_string);
    
    // hp bar row
    draw_health_bar(x+UI_BATTLE_HUD_WIDTH/2, hp_bar_y-bar_height/2, x+UI_BATTLE_HUD_WIDTH-UI_BATTLE_HUD_BUFFER_X, hp_bar_y+bar_height/2, user.act_hp_current/user.act_hp_max);
    /*
     * if user.owner.battle_show_details:
     *   - show exp bar (can be placeholder for now)
     *   - show hp text
     */
    if (user.owner==Camera.battle_pawn){
        // hp text row
        draw_set_halign(fa_center);
        draw_text(x+(UI_BATTLE_HUD_WIDTH-32)*3/4, hp_text_y, string(user.act_hp_current)+"/"+string(user.act_hp_max));
        
        // exp bar row
        var exp_next=get_experience(level+1, base.growth_rate);
        var f=(exp_next-user.experience)/(exp_next-get_experience(level, base.growth_rate));
        draw_exp_bar(x+64, exp_bar_y-exp_bar_height/2, x+UI_BATTLE_HUD_WIDTH-32, exp_bar_y+exp_bar_height/2, f);
    }
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
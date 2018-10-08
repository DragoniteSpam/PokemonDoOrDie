/// void BattleHUD.bg_draw_hud();

if (user!=noone){
    draw_rectangle_9s(spr_window9s_hgss, x, y, UI_BATTLE_HUD_WIDTH, UI_BATTLE_HUD_HEIGHT);
    
    draw_text(x+32, y+32, user.name);
    draw_sprite_ext(spr_gender, user.gender, x+UI_BATTLE_HUD_WIDTH-96, y+32, 2, 2, 0, c_white, 1);
    draw_text(x+UI_BATTLE_HUD_WIDTH-64, y+32, "Lv. ##");
    
    draw_health(x+2*UI_BATTLE_HUD_BUFFER_X, y+80, x+UI_BATTLE_HUD_WIDTH-UI_BATTLE_HUD_BUFFER_X, y+88, user.act_hp_current/user.act_hp_max);
    /*
     * if user.owner.battle_show_details:
     *   - show exp bar (can be placeholder for now)
     *   - show hp text
     */
}

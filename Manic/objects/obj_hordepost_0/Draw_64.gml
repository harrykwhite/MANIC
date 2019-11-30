if (global.game_combat_in_hordechallenge){
	var drawx = scr_world_to_screen_x(x + 4);
	var drawy = scr_world_to_screen_y(y - 37);
	
	draw_set_font(fnt_cambria_1);
	draw_set_halign(fa_center);
	scr_text(drawx, drawy, string(global.game_combat_in_hordechallenge_time div 60), c_white);
}
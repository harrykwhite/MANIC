// Red Tint
redtint_alphato = 0;
if (global.game_combat_state == CombatState.Buildup){
	redtint_alphato = 0.025;
}else if (global.game_combat_state == CombatState.Climax){
	redtint_alphato = 0.06;
}

if (redtint_alpha < redtint_alphato){
	redtint_alpha += 0.025;
}else if (redtint_alpha > redtint_alphato){
	redtint_alpha -= 0.025;
}

draw_set_colour(c_maroon);
draw_set_alpha(redtint_alpha);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1);

// Black Bars
if (blackbar_draw) || (global.cutscene_current != -1){
    blackbar_sizereal = approach(blackbar_sizereal, blackbar_size, 10);
}else{
	blackbar_sizereal = approach(blackbar_sizereal, 0, 10);
}

blackbar_sizereal = clamp(blackbar_sizereal, 0, blackbar_size);

if (blackbar_sizereal > 2){
	draw_set_colour(c_black);
	draw_rectangle(-10, -10, display_get_gui_width() + 10, blackbar_sizereal, false);
	draw_rectangle(-10, display_get_gui_height() + 10, display_get_gui_width() + 10, (display_get_gui_height() + 10) - (blackbar_sizereal + 10), false);
}

// Game Opening Intro
if (global.level_current == 0) && ((STATE == GameState.Public) || (global.game_playthrough)){
	if (game_opening_intro){
		var text = "Stalingrad";
		
		if (game_opening_intro_text_stage == 0){
			text = "Geta Presents";
		}
		
		draw_set_alpha(game_opening_intro_alpha);
		draw_set_colour(c_black);
		draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
		
		draw_set_alpha(game_opening_intro_text_alpha);
		draw_set_font(fnt_cambria_1);
		draw_set_halign(fa_center);
		scr_text_shadow(display_get_gui_width() / 2, display_get_gui_height() / 2, text, c_white);
	}
}

// Game Ending Screen
if (global.level_current == 0) && (STATE == GameState.Public){
	if (game_ending_screen){
		draw_set_alpha(game_ending_screen_alpha);
		draw_set_colour(c_black);
		draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
		
		draw_set_alpha(game_ending_screen_text_alpha);
		draw_set_font(fnt_cambria_1);
		scr_text_shadow(display_get_gui_width() / 2, display_get_gui_height() / 2, "Thanks for playing!", c_white);
		draw_set_font(fnt_cambria_0);
		scr_text_shadow(display_get_gui_width() / 2, (display_get_gui_height() / 2) + 60, "That's the end of the demo. If you have any questions\nmake sure to contact us at getagamesteam@gmail.com.", c_white);
	}
}

// Area Next
if (area_next_fade){
	if (area_next_alpha < 1){
		area_next_alpha += area_next_alpha_speed;
	}else{
		area_next_fade = false;
		area_next_alpha_speed = 0.01;
		scr_fade_object_list_reset();
		if (area_next_room != noone){
			scr_level_cleanup();
			room_goto(area_next_room);
		}
	}
}

draw_set_colour(c_black);
draw_set_alpha(area_next_alpha + pause_has_selected_time);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1);
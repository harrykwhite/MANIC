// Titlescreen
if (room == rm_title_0){
	with(obj_controller_titlescreen){
		event_user(0);
	}
}

// Indicate text
if (indicate_text_alpha > 0){
    if (indicate_text_time > 0){
        indicate_text_time --;
    } else {
        indicate_text_alpha -= 0.05;
    }

    draw_set_alpha(indicate_text_alpha);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(fnt_cambria_0);
    scr_text((display_get_gui_width() / 2), display_get_gui_height() - 96, indicate_text, c_white);
    draw_set_alpha(1);
} else {
    indicate_text = "";
    indicate_text_alpha = 0;
    indicate_text_time = 0;
}

draw_set_valign(fa_top);

// Debug
if (debug) && (global.cutscene_current == -1){
	var xx = display_get_gui_width() - 30;
	var yy = 21;
	
	if (global.game_option[| Options.ShowMinimap] && instance_exists(obj_controller_ui)){
		yy = 158;
	}
	
	var debug_text = "FPS: " + string(round(fps)) + "  RFPS: " + string(round(fps_real)) + "  INST: " + string(instance_number(all));
	var debug_text_width;
	
	draw_set_font(fnt_cambria_0);
	debug_text_width = string_width(debug_text) + 20;
	
	draw_set_halign(fa_right);
	scr_text(xx, yy, debug_text, c_white);
}

if (!instance_exists(obj_controller_ui)){
	// Warning prompt
	event_user(0);
	
	// Mouse
	with(obj_controller_mouse){
		event_user(0);
	}
}

// Titlescreen fade
if (room == rm_title_0){
	with(obj_controller_titlescreen){
		event_user(1);
	}
}
if (!obj_controller_all.show_ui){
	return;
}

var dwidth = display_get_gui_width();
var dheight = display_get_gui_height();

// Black Bars
if (blackbar_draw) || (global.cutscene_current != -1){
    blackbar_sizereal = approach(blackbar_sizereal, blackbar_size, 15);
}else{
	blackbar_sizereal = approach(blackbar_sizereal, 0, 15);
}

blackbar_sizereal = clamp(blackbar_sizereal, 0, blackbar_size);

if (blackbar_sizereal > 2){
	draw_set_colour(c_black);
	draw_rectangle(-10, -10, dwidth + 10, blackbar_sizereal, false);
	draw_rectangle(-10, dheight + 10, dwidth + 10, (dheight + 10) - (blackbar_sizereal + 10), false);
}

// Dialogue
if (dialogue_time > 0){
	var str = dialogue;
	var strw = 425;
	var xx = (dialogue_x - camera_get_view_x(view_camera[0])) * gui_scale_x;
	var yy = (dialogue_y - camera_get_view_y(view_camera[0])) * gui_scale_y;
	
	if (xx - (strw / 2) <= 0){
		strw -= abs((xx - (strw / 2)));
	}
	
	if (xx + (strw / 2) >= dwidth){
		strw -= abs(dwidth - (xx + (strw / 2)));
	}
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	
	draw_set_font(fnt_cambria_1);
	draw_set_colour(c_white);
	draw_text_ext(xx, yy, string_copy(str, 0, dialogue_char_count), -1, strw);
	
	if (global.cutscene_current != -1) && (dialogue_pause){
		draw_set_font(fnt_cambria_1);
		draw_set_halign(fa_right);
		draw_set_valign(fa_middle);
		
		if (dialogue_char_count >= dialogue_length){
			scr_text_shadow(dwidth - 24, dheight - 64, "Continue " + scr_input_get_name(InputBinding.Interact), c_white);
		}
		
		var holdstr = "Hold " + scr_input_get_name(InputBinding.Attack) + " to skip";
		scr_text_shadow(dwidth - 24, dheight - 34, holdstr, c_white);
		
		if (dialogue_skip > 0){
			var barw = string_width(holdstr);
			var barh = 2;
			draw_healthbar(dwidth - 24 - barw, dheight - 15 - barh, dwidth - 24, dheight - 15, (dialogue_skip / dialogue_skip_max) * 100, c_black, c_white, c_white, 0, false, false);
		}
	}
	
	draw_set_valign(fa_top);
}else{
	if (global.game_in_dialogue){
		global.game_in_dialogue = false;
	}
	
	dialogue_skip = 0;
	dialogue_pause = false;
}

// Level opening
if (level_opening){
	draw_set_alpha(level_opening_alpha);
	draw_set_colour(c_black);
	draw_rectangle(0, 0, dwidth, dheight, false);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_font(fnt_cambria_3);
	
	var line_width_to = string_width(string(global.level_name[global.level_current])) + 30;
	
	draw_set_alpha(level_opening_text_alpha * (level_opening_line_width / line_width_to));
	scr_text_shadow(dwidth / 2, (dheight / 2) - 26 + ((1 - (level_opening_line_width / line_width_to)) * 50), string(global.level_name[global.level_current]), c_white);
	
	if (level_opening_time < 60 * 4.5){
		level_opening_line_width = approach(level_opening_line_width, line_width_to, 5);
	}
	
	draw_set_colour(c_white);
	draw_rectangle((dwidth / 2) - (level_opening_line_width / 2), (dheight / 2) + 8, (dwidth / 2) + (level_opening_line_width / 2), (dheight / 2) + 8 + 1, false);
	
	var part_text = "PART " + string(global.level_current);
	
	if (global.level_current == Level.CityHeadquarters){
		part_text = "FINAL PART";
	}
	
	draw_set_font(fnt_cambria_1);
	scr_text_shadow((dwidth / 2), (dheight / 2) + 13, part_text, c_white);
}

// Area Next
var alpha = area_next_alpha + pause_has_selected_time;

if (area_next_fade){
	if (area_next_alpha < 1){
		area_next_alpha += area_next_alpha_speed;
	}else{
		area_next_fade = false;
		area_next_alpha_speed = 0.02;
		
		scr_fade_object_list_reset();
		
		if (area_next_room != noone){
			var lvl = scr_level_get_index(area_next_room);
			var clvl = scr_level_get_index(room);
			
			scr_level_cleanup(lvl != clvl);
			
			if (lvl != clvl){
				scr_level_persistent_reset_level(clvl);
				scr_level_persistent_set(lvl);
			}
			
			if (area_next_room == rm_title_0){
				ds_grid_clear(global.player_companions, -1);
				scr_fade_object_list_reset();
				scr_level_persistent_reset_level(clvl);
				scr_global_set();
				audio_stop_all();
			}
			
			room_goto(area_next_room);
		}
	}
}

if (alpha > 0){
	draw_set_colour(c_black);
	draw_set_alpha(alpha);
	draw_rectangle(0, 0, dwidth, dheight, false);
}

draw_set_alpha(1);
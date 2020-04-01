if (!obj_controller_all.show_ui){
	return;
}

var dwidth = display_get_gui_width();
var dheight = display_get_gui_height();

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
	scr_text(dwidth / 2, (dheight / 2) - 26 + ((1 - (level_opening_line_width / line_width_to)) * 50), string(global.level_name[global.level_current]), c_white);
	
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
	scr_text((dwidth / 2), (dheight / 2) + 13, part_text, c_white);
}

// Area Next
var alpha = area_next_alpha + pause_has_selected_time;

if (area_next_fade){
	if (area_next_alpha < 1){
		area_next_alpha += min(area_next_alpha_speed, 1 - area_next_alpha);
	}else{
		area_next_fade = false;
		area_next_alpha_speed = 0.02;
		
		scr_fade_object_list_reset();
		
		if (global.boss_current == Boss.SniperRobot){
			if (instance_exists(obj_pawn_other_train_1)){
				with(obj_pawn_other_train_1){
					instance_destroy();
				}
			}
		}
		
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
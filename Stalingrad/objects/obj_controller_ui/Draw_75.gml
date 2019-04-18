var dwidth = display_get_gui_width();
var dheight = display_get_gui_height();

// Black Bars
if (blackbar_draw) || (global.cutscene_current != -1){
    blackbar_sizereal = approach(blackbar_sizereal, blackbar_size, 5);
}else{
	blackbar_sizereal = approach(blackbar_sizereal, 0, 5);
}

blackbar_sizereal = clamp(blackbar_sizereal, 0, blackbar_size);

if (blackbar_sizereal > 2){
	draw_set_alpha(1);
	draw_set_colour(c_black);
	draw_rectangle(-10, -10, dwidth + 10, blackbar_sizereal, false);
	draw_rectangle(-10, dheight + 10, dwidth + 10, (dheight + 10) - (blackbar_sizereal + 10), false);
}

// Level opening
if (level_opening){
	draw_set_alpha(level_opening_alpha);
	draw_set_colour(c_black);
	draw_rectangle(0, 0, dwidth, dheight, false);
	
	draw_set_alpha(level_opening_text_alpha);
	draw_set_halign(fa_center);
	draw_set_font(fnt_cambria_3);
	scr_text_shadow(dwidth / 2, (dheight / 2) - 25, string(global.level_name[global.level_current]), c_white);
	//draw_rectangle((dwidth / 2) - 110, (dheight / 2) + 8, (dwidth / 2) + 110, (dheight / 2) + 8 + 1, false);
	draw_set_font(fnt_cambria_1);
	scr_text_shadow((dwidth / 2), (dheight / 2) + 13, "PART " + string(global.level_current + 1), c_white);
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
			scr_level_cleanup();
			
			if (area_next_room == rm_title_0){
				ds_grid_clear(global.player_companions, -1);
				scr_fade_object_list_reset();
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
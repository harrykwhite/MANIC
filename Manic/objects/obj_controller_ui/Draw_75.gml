var dwidth = display_get_gui_width();
var dheight = display_get_gui_height();

var iskeyboard = (global.game_input_type == InputType.Keyboard);

// Black Bars
if (blackbar_draw) || (global.cutscene_current != -1){
    blackbar_sizereal = approach(blackbar_sizereal, blackbar_size, 5);
}else{
	blackbar_sizereal = approach(blackbar_sizereal, 0, 5);
}

blackbar_sizereal = clamp(blackbar_sizereal, 0, blackbar_size);

if (blackbar_sizereal > 2){
	draw_set_colour(c_black);
	draw_rectangle(-10, -10, dwidth + 10, blackbar_sizereal, false);
	draw_rectangle(-10, dheight + 10, dwidth + 10, (dheight + 10) - (blackbar_sizereal + 10), false);
}

// Dialogue
var dialogue_voice_in = noone, dialogue_voice_loop = noone, dialogue_voice_out = noone;
var dialogue_voice_do_close = true;
var dialogue_voice_volume = 0.5;

var dialogue_voice_list = ds_list_create();

scr_dialogue_get_voice_from_in(dialogue_voice, dialogue_voice_list);

dialogue_voice_in = dialogue_voice_list[| 0];
dialogue_voice_loop = dialogue_voice_list[| 1];
dialogue_voice_out = dialogue_voice_list[| 2];

ds_list_destroy(dialogue_voice_list);

if (dialogue_time > 0){
	var str = dialogue;//string_copy(dialogue, 0, floor(dialogue_count));
	var xx = (dialogue_x - camera_get_view_x(view_camera[0])) * gui_scale_x;
	var yy = (dialogue_y - camera_get_view_y(view_camera[0])) * gui_scale_y;
	
	if (dialogue_break > 0){
		dialogue_break --;
	}else{
		if (dialogue_char_count < dialogue_length){
			if (string_char_at(dialogue, floor(dialogue_char_count)) == "."){
				dialogue_char_count += dialogue_char_speed * 0.5;
			}else{
				dialogue_char_count += dialogue_char_speed;
			}
			
			if (dialogue_voice != noone){
				if (!dialogue_voice_opened){
					var in = audio_play_sound(dialogue_voice_in, 3, false);
					audio_sound_gain(in, dialogue_voice_volume, 0);
					
					dialogue_voice_opened = true;
					dialogue_voice_closed = false;
				}else{
					if (!audio_is_playing(dialogue_voice_in)) && (!audio_is_playing(dialogue_voice_loop)){
						var vind = audio_play_sound(dialogue_voice_loop, 3, false);
						audio_sound_gain(vind, dialogue_voice_volume, 0);
						
						if ((dialogue_char_count div 2) != (dialogue_char_count / 2)){
							audio_sound_pitch(vind, 1.1);
						}
					}
				}
				
				dialogue_voice_do_close = false;
			}
		}
	}
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	
	draw_set_font(fnt_cambria_0);
	draw_set_colour(c_white);
	draw_text_ext(xx, yy, string_copy(str, 0, dialogue_char_count), -1, 280);
	
	if (global.cutscene_current != -1){
		draw_set_font(fnt_cambria_1);
		draw_set_halign(fa_right);
		draw_set_valign(fa_middle);
		
		if (dialogue_char_count >= dialogue_length){
			scr_text_shadow(dwidth - 24, dheight - 64, iskeyboard ? "Continue [" + scr_input_get_name(InputBinding.Interact) + "]" : "Continue " + scr_input_get_name(InputBinding.Interact), c_white);
			
			if (!iskeyboard){
				draw_sprite(global.game_input_gamepad_current_sprite, scr_input_get_symbol_ind(InputBinding.Interact), dwidth - 32, dheight - 64);
			}
		}
		
		var holdstr = iskeyboard ? "Hold [" + scr_input_get_name(InputBinding.Attack) + "] to skip" : "Hold " + scr_input_get_name(InputBinding.Attack) + "  to skip";
		scr_text_shadow(dwidth - 24, dheight - 34, holdstr, c_white);
		
		if (!iskeyboard){
			var xat = string_pos(scr_input_get_name(0), holdstr) + (string_length(scr_input_get_name(0)) / 2);
			var scale = string_width(holdstr) / string_length(holdstr);
			
			xat *= scale;
			
			draw_sprite(global.game_input_gamepad_current_sprite, scr_input_get_symbol_ind(InputBinding.Attack), dwidth - 24 - string_width(holdstr) + xat + 7, dheight - 34);
		}
		
		if (dialogue_skip > 0){
			var barw = string_width(holdstr);
			var barh = 3;
			draw_healthbar(dwidth - 24 - barw, dheight - 15 - barh, dwidth - 24, dheight - 15, (dialogue_skip / dialogue_skip_max) * 100, c_black, c_white, c_white, 0, false, false);
		}
	}
	
	if (!dialogue_pause){
		dialogue_time --;
	}
	
	draw_set_valign(fa_top);
}else{
	global.game_in_dialogue = false;
	dialogue_skip = 0;
	dialogue_pause = false;
}

if (dialogue_voice_do_close) && (dialogue_voice != noone){
	if (!dialogue_voice_closed){
		if (!audio_is_playing(dialogue_voice_out)){
			var out = audio_play_sound(dialogue_voice_out, 3, false);
			audio_sound_gain(out, dialogue_voice_volume, 0);
			
			dialogue_voice_closed = true;
		}
	}
}

// Level opening
if (level_opening){
	draw_set_alpha(level_opening_alpha);
	draw_set_colour(c_black);
	draw_rectangle(0, 0, dwidth, dheight, false);
	
	draw_set_halign(fa_center);
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
			scr_level_cleanup(scr_level_get_index(area_next_room) != scr_level_get_index(room));
			
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
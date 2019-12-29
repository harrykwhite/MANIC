var titlescale = wave(1.3, 1.35, 4, 0);
var selected_set = false;
var angle = wave(-1, 1, 6, 0);

var mousex = scr_world_to_screen_x(obj_controller_mouse.x);
var mousey = scr_world_to_screen_y(obj_controller_mouse.y);

var logox = display_get_gui_width() / 2;
var logoy = (display_get_gui_height() / 2) - 240;

if (in_settings_controls){
	logoy -= 40;
}

var iskeyboard = (global.game_input_type == InputType.Keyboard);

if (iskeyboard){
	selected = -1;
}

draw_set_font(fnt_cambria_6);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

scr_text_transformed(logox, logoy, "MANIC", c_white, titlescale, titlescale, angle);

draw_set_font(fnt_cambria_2);

if (isteaser){
	scr_text_transformed(logox + lengthdir_x(38, angle - 90), logoy + lengthdir_y(38, angle - 90), "Teaser", c_white, titlescale / 1.3, titlescale / 1.3, angle);
}

if (!in_settings) && (!in_levelselect){
    for (var i = 0; i <= option_max; i ++){
        var str = option[i];
        var xx = (display_get_gui_width() / 2);
        var yy = (((display_get_gui_height() / 2) - (48 * option_max * 0.5)) + (48 * i));
        var islocked = false;

        if (i != option_max) && (i != -1){
            islocked = option_locked[i];
        }

        if (!selected_set) && (!fade) && (!obj_controller_all.warning_prompt) && (iskeyboard){
            if (!islocked){
                if (point_in_rectangle(mousex, mousey, xx - 80, yy - 16, xx + 80, yy + 16)){
                    selected = i;
                    selected_set = true;
                }
            }
        }

        if (selected == i) && (!obj_controller_all.warning_prompt){
            option_scale[i] = approach(option_scale[i], 1.1, 40);
        } else {
            option_scale[i] = approach(option_scale[i], 1, 40);
        }

        if (islocked){
            scr_text_transformed(xx, yy, str, c_gray, option_scale[i], option_scale[i], 0);
        } else {
            if (selected == i) && (!obj_controller_all.warning_prompt){
                scr_text_transformed(xx, yy, str, make_colour_rgb(189, 23, 23), option_scale[i], option_scale[i], 0);

                if (i == 0) && (string_pos("Continue", option[i]) != 0){
                    draw_set_font(fnt_cambria_0);
                    scr_text_transformed(xx, yy + 22, scr_seconds_to_timer(global.game_save_seconds) + " - " + global.level_name[global.game_save_level], c_white, 0.75, 0.75, 0);
                    draw_set_font(fnt_cambria_2);
                }
            } else {
                scr_text_transformed(xx, yy, str, c_white, option_scale[i], option_scale[i], 0);
            }
        }
    }
} else if (in_settings) && (!in_levelselect){
    if (in_settings_gameplay) || (in_settings_display) || (in_settings_audio) || (in_settings_controls){
        var omax = option_setting_max;
		
        if (in_settings_gameplay){
            omax = option_setting_gameplay_max;
        } else if (in_settings_display){
            omax = option_setting_display_max;
        } else if (in_settings_audio){
            omax = option_setting_audio_max;
        } else if (in_settings_controls){
			omax = -2;
		}

        for (var i = 0; i <= omax + 2; i ++){
            var str = "";
            var adjust_str = "";
            var isbool = false, isres = false;
            var whitecol = c_white;

            var value_cur = 0;
            var value_min = 0;
            var value_max = 0;
            var scale = 1;
            var centered = false;

            var xx = (display_get_gui_width() / 2);
            var yy = (((display_get_gui_height() / 2) - (48 * omax * 0.5)) + (48 * i));
			
			if (in_settings_controls){
				yy += 246;
			}else if (i > omax){
                yy += 24;
            }

            if (!fade) && (!obj_controller_all.warning_prompt) && (iskeyboard){
                if (!selected_set){
                    var w = 80;

                    if (i != omax + 1) && (i != omax + 2){
                        w = 180;
                    }

                    if (point_in_rectangle(mousex, mousey, xx - w, yy - 16, xx + w, yy + 16)){
                        selected = i;
                        selected_set = true;
                    }
                }
            }

            if (i == omax + 1){
                str = "Reset to Defaults";
                centered = true;

                if (selected == i) && (!obj_controller_all.warning_prompt){
                    reset_text_scale = approach(reset_text_scale, 1.05, 40);
                } else {
                    reset_text_scale = approach(reset_text_scale, 1, 40);
                }

                scale = reset_text_scale;
            } else if (i == omax + 2){
                str = "Back to Options";
                centered = true;

                if (selected == i) && (!obj_controller_all.warning_prompt){
                    return_text_scale = approach(return_text_scale, 1.05, 40);
                } else {
                    return_text_scale = approach(return_text_scale, 1, 40);
                }

                scale = return_text_scale;
            } else {
                if (in_settings_gameplay){
                    value_cur = option_setting_gameplay_value[i];
                    value_min = option_setting_gameplay_value_min[i];
                    value_max = option_setting_gameplay_value_max[i];

                    str = option_setting_gameplay[i];
                    adjust_str = string(value_cur) + option_setting_gameplay_unit[i];

                    if (selected == i) && (!obj_controller_all.warning_prompt){
                        option_setting_gameplay_scale[i] = approach(option_setting_gameplay_scale[i], 1.05, 40);
                    } else {
                        option_setting_gameplay_scale[i] = approach(option_setting_gameplay_scale[i], 1, 40);
                    }

                    scale = option_setting_gameplay_scale[i];
                } else if (in_settings_display){
                    value_cur = option_setting_display_value[i];
                    value_min = option_setting_display_value_min[i];
                    value_max = option_setting_display_value_max[i];

                    str = option_setting_display[i];
                    adjust_str = string(value_cur) + option_setting_display_unit[i];

                    if (selected == i) && (!obj_controller_all.warning_prompt){
                        option_setting_display_scale[i] = approach(option_setting_display_scale[i], 1.05, 40);
                    } else {
                        option_setting_display_scale[i] = approach(option_setting_display_scale[i], 1, 40);
                    }

                    scale = option_setting_display_scale[i];
                } else if (in_settings_audio){
                    value_cur = option_setting_audio_value[i];
                    value_min = option_setting_audio_value_min[i];
                    value_max = option_setting_audio_value_max[i];

                    str = option_setting_audio[i];
                    adjust_str = string(value_cur) + option_setting_audio_unit[i];

                    if (selected == i) && (!obj_controller_all.warning_prompt){
                        option_setting_audio_scale[i] = approach(option_setting_audio_scale[i], 1.05, 40);
                    } else {
                        option_setting_audio_scale[i] = approach(option_setting_audio_scale[i], 1, 40);
                    }

                    scale = option_setting_audio_scale[i];
                }
            }

            isbool = string_pos("[BOOL]", adjust_str) != 0;
            isres = string_pos("[RESOLUTION]", adjust_str) != 0;

            if (isbool){
                if (!value_cur){
                    adjust_str = "Disabled";
                } else {
                    adjust_str = "Enabled";
                }
            }

            if (isres){
                var resolutions = scr_resolution_options();
                var value = ds_list_find_value(resolutions, value_cur);
				
                if (value == 0) || (value == undefined){
                    adjust_str = ds_list_find_value(resolutions, ds_list_size(resolutions) - 1);
                } else {
                    adjust_str = value;
                }
				
                ds_list_destroy(resolutions);
            }

			adjust_str = string(adjust_str) + " >";
            adjust_str = string_insert("< ", adjust_str, 0);

            if (centered){
                draw_set_halign(fa_center);

                if (selected == i) && (!obj_controller_all.warning_prompt){
                    scr_text_transformed(xx, yy, str, make_colour_rgb(189, 23, 23), scale, scale, 0);
                } else {
                    scr_text_transformed(xx, yy, str, whitecol, scale, scale, 0);
                }
            } else {
                if (selected == i) && (!obj_controller_all.warning_prompt){
                    draw_set_halign(fa_left);
                    scr_text_transformed(xx - 175, yy, str, make_colour_rgb(189, 23, 23), scale, scale, 0);
                    draw_set_halign(fa_right);
                    scr_text_transformed(xx + 175, yy, adjust_str, make_colour_rgb(189, 23, 23), scale, scale, 0);
                } else {
                    draw_set_halign(fa_left);
                    scr_text_transformed(xx - 175, yy, str, whitecol, scale, scale, 0);
                    draw_set_halign(fa_right);
                    scr_text_transformed(xx + 175, yy, adjust_str, whitecol, scale, scale, 0);
                }
            }
        }
		
		if (in_settings_controls){
			var bgpstr = "Press any key to switch to keyboard mode";
			var bcount = InputBinding.SwitchWeaponForward + 1;
			
			if (iskeyboard){
				bgpstr = "Press any controller button to switch to gamepad mode";
			}
			
			draw_set_font(fnt_cambria_n1);
			
			for(var b = 0; b < bcount; b ++){
				var bx = display_get_gui_width() / 2;
				var by = ((display_get_gui_height() / 2) - (36 * bcount * 0.5)) + (36 * b) + 30;
				
				draw_set_halign(fa_left);
				
				scr_text(bx - 270, by, scr_input_get_name_action(b), c_white);
				
				draw_set_halign(fa_right);
				
				var bctext = scr_input_get_name(b);
				
				scr_text(bx + 270, by, bctext, c_white);
			}
			
			draw_set_halign(fa_center);
			scr_text(display_get_gui_width() / 2, ((display_get_gui_height() / 2) - (36 * bcount * 0.5)) + (36 * bcount) + 40, bgpstr, c_white);
		}
		
    } else {
        for (var i = 0; i <= option_setting_max + 1; i ++){
            var str = "";
            var xx = (display_get_gui_width() / 2);
            var yy = (((display_get_gui_height() / 2) - (48 * option_setting_max * 0.5)) + (48 * i));
            var scale = 1;
			
			if (i >= option_setting_max){
				yy += 24;
			}
			
            if (!selected_set) && (!fade) && (!obj_controller_all.warning_prompt) && (iskeyboard){
                if (point_in_rectangle(mousex, mousey, xx - 80, yy - 16, xx + 80, yy + 16)){
                    selected = i;
                    selected_set = true;
                }
            }

            if (i != option_setting_max + 1){
                str = option_setting[i];

                if (selected == i) && (!obj_controller_all.warning_prompt){
                    option_setting_scale[i] = approach(option_setting_scale[i], 1.1, 40);
                } else {
                    option_setting_scale[i] = approach(option_setting_scale[i], 1, 40);
                }

                scale = option_setting_scale[i];
            } else {
                str = "Back to Title";

                if (selected == i) && (!obj_controller_all.warning_prompt){
                    return_text_scale = approach(return_text_scale, 1.1, 40);
                } else {
                    return_text_scale = approach(return_text_scale, 1, 40);
                }

                scale = return_text_scale;
            }

            if (selected == i) && (!obj_controller_all.warning_prompt){
                scr_text_transformed(xx, yy, str, make_colour_rgb(189, 23, 23), scale, scale, 0);
            } else {
                scr_text_transformed(xx, yy, str, c_white, scale, scale, 0);
            }
        }
    }
} else if (in_levelselect){
    draw_set_font(fnt_cambria_0);

    for (var i = 0; i <= option_levelselect_max + 1; i ++){
        var str = "";
        var scale = 1;
        var xx = (display_get_gui_width() / 2);
        var yy = (((display_get_gui_height() / 2) - (29 * option_levelselect_max * 0.5)) + (29 * i));
        var islocked = false;
		
        if (i < option_levelselect_max + 1){
            if (!option_levelselect_unlocked[i]){
                islocked = true;
            }
        }else{
			yy += 24;
		}
		
        if (!selected_set) && (!fade) && (!obj_controller_all.warning_prompt) && (iskeyboard){
            if (!islocked){
                if (point_in_rectangle(mousex, mousey, xx - 80, yy - 16, xx + 80, yy + 16)){
                    selected = i;
                    selected_set = true;
                }
            }
        }

        if (i != option_levelselect_max + 1){
            str = option_levelselect[i];
            if (selected == i) && (!obj_controller_all.warning_prompt){
                option_levelselect_scale[i] = approach(option_levelselect_scale[i], 1.1, 40);
            } else {
                option_levelselect_scale[i] = approach(option_levelselect_scale[i], 1, 40);
            }

            scale = option_levelselect_scale[i];
        } else {
            str = "Back to Title";

            if (selected == i) && (!obj_controller_all.warning_prompt){
                return_text_scale = approach(return_text_scale, 1.1, 40);
            } else {
                return_text_scale = approach(return_text_scale, 1, 40);
            }

            scale = return_text_scale;
        }

        if (islocked){
            scr_text_transformed(xx, yy, "?????", c_gray, scale, scale, 0);
        } else {
            if (selected == i) && (!obj_controller_all.warning_prompt){
                scr_text_transformed(xx, yy, str, make_colour_rgb(189, 23, 23), scale, scale, 0);
            } else {
                scr_text_transformed(xx, yy, str, c_white, scale, scale, 0);
            }
        }
    }
}

// Fullscreen text
draw_set_font(fnt_cambria_0);

draw_set_halign(fa_left);
draw_set_valign(fa_bottom);

var fkey = "[F]";
var fkey_x = 18;
var fkey_y = display_get_gui_height() - 24;

if (window_get_fullscreen()){
	scr_text(fkey_x, fkey_y, fkey + " Windowed", c_white);
}else{
	scr_text(fkey_x, fkey_y, fkey + " Fullscreen", c_white);
}

// Copyright text
draw_set_halign(fa_right);
scr_text(display_get_gui_width() - 20, display_get_gui_height() - 24, (isteaser ? "Playable Teaser" : gameversion) + "\n(c)2020 Geta Games", c_white);
draw_set_valign(fa_top);
draw_set_alpha(1);
var iskeyboard = (global.game_input_type == InputType.Keyboard);

var mousex = scr_world_to_screen_x(obj_controller_mouse.x);
var mousey = scr_world_to_screen_y(obj_controller_mouse.y);

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

// Warning prompt
if (warning_prompt){
    if (warning_prompt_alpha < 1){
        warning_prompt_alpha += 0.1;
    }
} else {
    if (warning_prompt_alpha > 0){
        warning_prompt_alpha -= 0.1;
    } else {
        warning_prompt_selected = (iskeyboard ? -1 : 1);
        warning_prompt_alpha = 0;
        warning_prompt_scale[0] = 1;
        warning_prompt_scale[1] = 1;
    }
}

if (warning_prompt_alpha > 0){
    draw_set_alpha(warning_prompt_alpha * 0.7);
    draw_set_colour(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

    draw_set_alpha(warning_prompt_alpha);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(fnt_cambria_2);
    scr_text((display_get_gui_width() / 2), (display_get_gui_height() / 2) - 45, warning_prompt_text, c_white);

	if (iskeyboard){
		warning_prompt_selected = -1;
	}

    for (var i = 0; i < 2; i ++){
        var wtext = (i == 0 ? "Yes" : "No");
        var wcol = c_white;

        var xx = (display_get_gui_width() / 2) + (i == 0 ? -45 : 45);
        var yy = (display_get_gui_height() / 2) + 25;

        if (warning_prompt && iskeyboard){
            if (point_in_rectangle(mousex, mousey, xx - 34, yy - 16, xx + 34, yy + 16)){
                warning_prompt_selected = i;
            }
        }

        if (warning_prompt_selected == i){
            warning_prompt_scale[i] = approach(warning_prompt_scale[i], 1.2, 40);
            wcol = make_colour_rgb(189, 23, 23);
        } else {
            warning_prompt_scale[i] = approach(warning_prompt_scale[i], 1, 40);
        }

        scr_text_transformed(xx, yy, wtext, wcol, warning_prompt_scale[i], warning_prompt_scale[i], 0);
    }

    draw_set_valign(fa_top);
    draw_set_alpha(1);
}
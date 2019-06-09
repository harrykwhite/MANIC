// Draw Line
if (!global.game_pause) && (global.cutscene_current == -1){
	var xx = x + lengthdir_x(25, image_angle);
	var yy = y + lengthdir_y(25, image_angle);
	
	if (line_alpha > 0.85){
		if (line_flicker_time > 0){
			line_flicker_time --;
		}else{
			line_flicker = !line_flicker;
			line_flicker_time = 8;
		}
	}else{
		line_flicker_time = 8;
		line_flicker = false;
	}
	
	draw_set_colour(c_maroon);
	
	if (line_flicker){
		draw_set_colour(c_red);
	}
	
	draw_set_alpha(clamp(line_alpha, 0, 1) * 0.6);
	draw_line_break(xx, yy, image_angle, obj_p_solid, 1, false, -6);
	draw_set_alpha(1);
}

draw_self();
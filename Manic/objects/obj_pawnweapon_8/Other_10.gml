// Draw Line
if (!global.game_pause) && (global.cutscene_current == -1){
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
	
	draw_set_alpha(clamp(line_alpha, 0, 1) * 0.6 * image_alpha);
	draw_line_break(x, y, image_angle, obj_p_solid, 1, false, 0);
	
	draw_set_alpha(1);
}

scr_pre_draw_attributes_pawn_weapon();
draw_self();
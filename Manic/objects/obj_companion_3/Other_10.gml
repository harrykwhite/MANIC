if (!global.game_pause){
	i_time_alpha = 1;
	if (i_time > 0){
		if (i_time_flicker){
			i_time_alpha = 0.25;
		}else{
			i_time_alpha = 0.7;
		}
	
		if (i_time_flicker_time < 6){
			i_time_flicker_time ++;
		}else{
			i_time_flicker = !i_time_flicker;
			i_time_flicker_time = 0;
		}
	}else{
		i_time_flicker = false;
		i_time_flicker_time = 0;
	}
}

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha * i_time_alpha);
scr_draw_attributes_pawn();
scr_pre_draw_attributes_pawn();
draw_self();
scr_draw_attributes_pawn();

var linealpha = shoot_buildup_time / 120;

if (instance_exists(obj_player)){
	shoot_dir = point_direction(x, y, obj_player.x, obj_player.y);
	
	if (shoot_buildup_time < 120){
		if (linealpha > 0.85){
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

		draw_set_colour(c_red);

		if (line_flicker){
			draw_set_colour(c_ltgray);
		}
		
		draw_set_alpha(clamp(linealpha, 0, 1) * 0.7);
		draw_line_break(x, y, shoot_dir, obj_p_solid, 1, false, -6);
		draw_set_alpha(1);
	}
}

draw_sprite_ext(spr_giantturret_gun_0, 0, x, y, image_xscale, image_yscale, shoot_dir, c_white, 1);
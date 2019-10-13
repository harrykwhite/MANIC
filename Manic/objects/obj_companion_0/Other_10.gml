burn = false;
poison = false;
headless = false;

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

// Shadow
var shadow_x = x;
var shadow_y = y + 22;
var shadow_width = 16;
var shadow_height = 5;

draw_set_colour(c_black);
draw_set_alpha(0.2);
draw_ellipse(shadow_x - (shadow_width / 2), shadow_y - (shadow_height / 2), shadow_x + (shadow_width / 2), shadow_y + (shadow_height / 2), false);
draw_set_alpha(1);

// Draw
scr_pawn_companion_draw_outline();

scr_pre_draw_attributes_pawn();
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha * i_time_alpha);
scr_draw_attributes_pawn();
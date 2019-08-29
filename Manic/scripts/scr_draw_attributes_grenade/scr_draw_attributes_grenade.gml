gpu_set_fog(true, c_ltgray, 0, 0);

if (alpha_flicker){
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, 0.9);
}

if (explode_anim){
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, ((scale / 1.2) + 0.4) * 0.7);
}

gpu_set_fog(false, c_black, 0, 0);
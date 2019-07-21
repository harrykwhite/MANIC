var alpha = wave(0.02, 0.06, 0.7, 0);

gpu_set_fog(true, c_ltgray, 0, 0);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, alpha);

if (explode_anim){
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, ((scale / 1.2) + 0.4) * 0.7);
}

gpu_set_fog(false, c_black, 0, 0);
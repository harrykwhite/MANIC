draw_self();

if (image_xscale > 1) || (image_yscale > 1){
	var mult = mean(image_xscale - 1, image_yscale - 1) / 0.15;
	
	gpu_set_fog(true, c_white, 0, 0);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha * mult);
	gpu_set_fog(false, c_black, 0, 0);
}
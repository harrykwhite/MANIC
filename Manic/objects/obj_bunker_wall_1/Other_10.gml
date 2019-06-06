draw_self();
if (explode_anim){
	gpu_set_fog(true, c_ltgray, 0, 0);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, scale);
	gpu_set_fog(false, c_black, 0, 0);
}
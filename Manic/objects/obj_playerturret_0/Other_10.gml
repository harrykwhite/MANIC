draw_sprite_ext(spr_playerturret_stand_0, 0, x, y, image_yscale, scale, 0, c_white, 1);
draw_self();

if (activated_alpha > 0){
	gpu_set_fog(true, c_black, 0, 0);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha * 0.5 * (1 - activated_alpha));
	gpu_set_fog(false, c_black, 0, 0);
}
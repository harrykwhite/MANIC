var yy = y + (dsin(yoffset_time) * yoffset_max);

gpu_set_fog(true, outlinewhite, 0, 0);
draw_sprite_ext(sprite_index, image_index, x + 1, yy, image_xscale, image_yscale, image_angle, image_blend, image_alpha * 0.8);
draw_sprite_ext(sprite_index, image_index, x - 1, yy, image_xscale, image_yscale, image_angle, image_blend, image_alpha * 0.8);
draw_sprite_ext(sprite_index, image_index, x, yy + 1, image_xscale, image_yscale, image_angle, image_blend, image_alpha * 0.8);
draw_sprite_ext(sprite_index, image_index, x, yy - 1, image_xscale, image_yscale, image_angle, image_blend, image_alpha * 0.8);
gpu_set_fog(false, c_black, 0, 0);

draw_sprite_ext(sprite_index, image_index, x, yy, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

if (flash > 0){
	gpu_set_fog(true, c_white, 0, 0);
	draw_sprite_ext(sprite_index, image_index, x, yy, image_xscale, image_yscale, image_angle, image_blend, image_alpha * (flash / 5));
	gpu_set_fog(false, c_black, 0, 0);
}
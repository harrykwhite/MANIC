draw_sprite_ext(sprite, 0, x, y, xscale, yscale, angle, c_white, alpha);

if (special == "LowHealth"){
	gpu_set_fog(true, make_colour_hsv(0, 60, 85), 0, 0);
	draw_sprite_ext(sprite, 0, x, y, xscale, yscale, angle, c_white, alpha * 0.4);
	gpu_set_fog(false, c_black, 0, 0);
}
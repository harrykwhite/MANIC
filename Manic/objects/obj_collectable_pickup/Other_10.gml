var yy = wave(-1, -3, 1, 0);

gpu_set_fog(true, c_black, 0, 0);
draw_sprite_ext(sprite, 0, x, y, scale, scale, angle, c_white, alpha * 0.135);
gpu_set_fog(false, c_black, 0, 0);

if (pickup){
	gpu_set_fog(true, outlinewhite, 0, 0);
	draw_sprite_ext(sprite, 0, x + lengthdir_x(1, angle), y + yy + lengthdir_y(1, angle), scale, scale, angle, c_white, 1);
	draw_sprite_ext(sprite, 0, x + lengthdir_x(1, angle + 90), y + yy + lengthdir_y(1, angle + 90), scale, scale, angle, c_white, 1);
	draw_sprite_ext(sprite, 0, x + lengthdir_x(1, angle + 180), y + yy + lengthdir_y(1, angle + 180), scale, scale, angle, c_white, 1);
	draw_sprite_ext(sprite, 0, x + lengthdir_x(1, angle + 270), y + yy + lengthdir_y(1, angle + 270), scale, scale, angle, c_white, 1);
	gpu_set_fog(false, c_black, 0, 0);
}

draw_sprite_ext(sprite, 0, x, y + yy, scale, scale, angle, c_white, 1);
mask_index = spr_mask_0;
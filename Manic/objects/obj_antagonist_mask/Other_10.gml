var yy = wave(-1, -3, 1, 0), glow = wave(0.9, 1, 2, 0);

gpu_set_fog(true, c_black, 0, 0);
draw_sprite_ext(sprite_index, image_angle, x, y, 1, 1, image_angle, c_white, 0.135);
gpu_set_fog(false, c_black, 0, 0);

draw_sprite_ext(sprite_index, 0, x, y + yy, 1, 1, image_angle, c_white, 1);

gpu_set_fog(true, c_white, 0, 0);
draw_sprite_ext(sprite_index, 0, x, y + yy, 1, 1, image_angle, c_white, 0.05 * glow);
gpu_set_fog(false, c_black, 0, 0);
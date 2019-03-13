var yy = wave(-1, -3, 1, 0);

gpu_set_fog(true, c_black, 0, 0);
draw_sprite_ext(sprite, image_angle, x, y, scale, scale, angle, c_white, alpha * 0.4);
gpu_set_fog(false, c_black, 0, 0);

draw_sprite_ext(sprite, 0, x, y + yy, scale, scale, angle, c_white, 1);
mask_index = spr_mask_0;
var yy = wave(-1, -3, 1, 0), glow = wave(0.9, 1, 2, 0);
var sprite = global.upgrade_sprite_pickup[index];

gpu_set_fog(true, c_black, 0, 0);
draw_sprite_ext(sprite, image_angle, x, y, 1.25, 1.25, angle, c_white, 0.175);
gpu_set_fog(false, c_black, 0, 0);

draw_sprite_ext(sprite, 0, x, y + yy, 1.25, 1.25, angle, c_white, 1);

gpu_set_fog(true, c_white, 0, 0);
draw_sprite_ext(sprite, 0, x, y + yy, 1.3 * glow, 1.3 * glow, angle, c_white, 0.4 * glow);
gpu_set_fog(false, c_black, 0, 0);

mask_index = spr_mask_0;
var alpha = 1 - image_alpha;
alpha = 1 - (alpha * 2);
alpha = clamp(alpha, 0, 1);

gpu_set_fog(true, outlinecompanion, 0, 0);
draw_sprite_ext(sprite_index, image_index, x - 1, y, image_xscale, image_yscale, image_angle, image_blend, alpha);
draw_sprite_ext(sprite_index, image_index, x + 1, y, image_xscale, image_yscale, image_angle, image_blend, alpha);
draw_sprite_ext(sprite_index, image_index, x, y - 1, image_xscale, image_yscale, image_angle, image_blend, alpha);
draw_sprite_ext(sprite_index, image_index, x, y + 1, image_xscale, image_yscale, image_angle, image_blend, alpha);
gpu_set_fog(false, c_black, 0, 0);
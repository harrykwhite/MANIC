gpu_set_fog(true, outlinecompanion, 0, 0);
draw_sprite_ext(sprite_index, image_index, x - 1, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(sprite_index, image_index, x + 1, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(sprite_index, image_index, x, y - 1, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(sprite_index, image_index, x, y + 1, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
gpu_set_fog(false, c_black, 0, 0);
var yy = y + (dsin(yoffset_time) * yoffset_max);

gpu_set_fog(true, outlinewhite, 0, 0);
draw_sprite_ext(sprite_index, image_index, x + 1, yy, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(sprite_index, image_index, x - 1, yy, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(sprite_index, image_index, x, yy + 1, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(sprite_index, image_index, x, yy - 1, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
gpu_set_fog(false, c_black, 0, 0);

draw_sprite_ext(sprite_index, image_index, x, yy, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
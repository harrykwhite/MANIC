gpu_set_fog(true, outlineexplosive, 0, 0);

draw_sprite_ext(sprite_index, image_index, x + lengthdir_x(1, image_angle), y + lengthdir_y(1, image_angle), image_xscale, image_yscale, image_angle, c_white, image_alpha);
draw_sprite_ext(sprite_index, image_index, x + lengthdir_x(1, image_angle + 90), y + lengthdir_y(1, image_angle + 90), image_xscale, image_yscale, image_angle, c_white, image_alpha);
draw_sprite_ext(sprite_index, image_index, x + lengthdir_x(1, image_angle + 180), y + lengthdir_y(1, image_angle + 180), image_xscale, image_yscale, image_angle, c_white, image_alpha);
draw_sprite_ext(sprite_index, image_index, x + lengthdir_x(1, image_angle + 270), y + lengthdir_y(1, image_angle + 270), image_xscale, image_yscale, image_angle, c_white, image_alpha);

gpu_set_fog(false, c_black, 0, 0);

draw_self();
scr_draw_attributes_grenade();
var yy = wave(-1, -3, 1, 0);
var sprite = global.upgrade_sprite_pickup[index];
var drawscale = 1.25;

// Shadow
gpu_set_fog(true, c_black, 0, 0);
draw_sprite_ext(sprite, 0, x, y, drawscale, drawscale, angle, c_white, 0.2);
gpu_set_fog(false, c_black, 0, 0);

// Outline
var outline_alpha = 0.6;
var outline_colour = outlineupgrade;

gpu_set_fog(true, outline_colour, 0, 0);
draw_sprite_ext(sprite, 0, x + lengthdir_x(1, angle), y + yy + lengthdir_y(1, angle), drawscale, drawscale, angle, c_white, outline_alpha);
draw_sprite_ext(sprite, 0, x + lengthdir_x(1, angle + 90), y + yy + lengthdir_y(1, angle + 90), drawscale, drawscale, angle, c_white, outline_alpha);
draw_sprite_ext(sprite, 0, x + lengthdir_x(1, angle + 180), y + yy + lengthdir_y(1, angle + 180), drawscale, drawscale, angle, c_white, outline_alpha);
draw_sprite_ext(sprite, 0, x + lengthdir_x(1, angle + 270), y + yy + lengthdir_y(1, angle + 270), drawscale, drawscale, angle, c_white, outline_alpha);
gpu_set_fog(false, c_black, 0, 0);

// Base sprite
draw_sprite_ext(sprite, 0, x, y + yy, drawscale, drawscale, angle, c_ltgray, 1);
mask_index = spr_mask_0;
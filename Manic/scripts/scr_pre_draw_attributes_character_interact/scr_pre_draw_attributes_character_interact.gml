///@param shadow_x
///@param shadow_y

// Shadow
var shadow_x = argument0;
var shadow_y = argument1;
var shadow_width = 20;
var shadow_height = 4;

draw_set_colour(c_black);
draw_set_alpha(0.2);
draw_ellipse(shadow_x - (shadow_width / 2), shadow_y - (shadow_height / 2), shadow_x + (shadow_width / 2), shadow_y + (shadow_height / 2), false);
draw_set_alpha(1);

// Interact
if (interact){
	gpu_set_fog(true, outlinewhite, 0, 0);
	draw_sprite_ext(sprite_index, image_index, x - 1, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	draw_sprite_ext(sprite_index, image_index, x + 1, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	draw_sprite_ext(sprite_index, image_index, x, y - 1, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	draw_sprite_ext(sprite_index, image_index, x, y + 1, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	gpu_set_fog(false, c_black, 0, 0);
}
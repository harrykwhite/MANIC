/// @param x
/// @param  y
/// @param  size
/// @param  colour
var xx = argument0;
var yy = argument1;
var size = argument2;
var col = argument3;

if (!surface_exists(surf_light)){
	exit;
}

gpu_set_blendmode(bm_subtract);
surface_set_target(surf_light);
draw_ellipse_colour(xx - size / 2, yy - size / 2, xx + size / 2, yy + size / 2, col, c_black, false);
surface_reset_target();
gpu_set_blendmode(bm_normal);
///@param x
///@param y
///@param radius
///@param colour_start
///@param colour_end
var xx = argument0;
var yy = argument1;
var radius = argument2;
var colstart = argument3;
var colend = argument4;

for(var r = radius; r >= 0; r --){
	draw_set_colour(merge_color(colstart, colend, r / radius));
	draw_circle(xx, yy, r, false);
}
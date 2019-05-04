///scr_draw_line_alpha(x1, y1, x2, y2, alpha, linewidth, offset);
///@param x1
///@param y1
///@param x2
///@param y2
///@param alpha
///@param linewidth
///@param offset
var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;
var alpha = argument4;
var linewidth = max(1, (argument5 - 1));
var offset = argument6;

var width = x2 - x1;
var height = y2 - y1;
var len = sqrt(sqr(width) + sqr(height));
var interval = min(15, len);
len /= interval;

var dir = point_direction(x1, y1, x2, y2);

for(var i = 0; i < len; i ++){
	
	var xx = (x1 + lengthdir_x(i * interval, dir));
	var yy = (y1 + lengthdir_y(i * interval, dir));
	
	draw_set_alpha((alpha * (i / len)) + offset);
	draw_line_width(xx, yy, xx + lengthdir_x(interval, dir), yy + lengthdir_y(interval, dir), linewidth);
}

draw_set_alpha(1);
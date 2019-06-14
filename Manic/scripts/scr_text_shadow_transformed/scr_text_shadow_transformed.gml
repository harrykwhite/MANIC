///@param x
///@param y
///@param string
///@param basecol
///@param xscale
///@param yscale
///@param angle
var xx = argument0;
var yy = argument1;
var str = argument2;
var basecol = argument3;
var xscale = argument4;
var yscale = argument5;
var angle = argument6;

//if (basecol != make_colour_rgb(189, 23, 23)){
//	draw_set_colour(make_colour_rgb(40, 40, 40));
//}else{
//	draw_set_colour(make_colour_rgb(30, 4, 4));
//}

//draw_text_transformed(xx + 3, yy + 3, str, xscale, yscale, angle);
draw_set_colour(basecol);
draw_text_transformed(xx, yy, str, xscale, yscale, angle);
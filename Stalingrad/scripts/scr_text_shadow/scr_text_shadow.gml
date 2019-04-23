///@param x
///@param y
///@param string
///@param basecol
var xx = argument0;
var yy = argument1;
var str = argument2;
var basecol = argument3;

//if (basecol != make_colour_rgb(189, 23, 23)){
//	draw_set_colour(make_colour_rgb(40, 40, 40));
//}else{
//	draw_set_colour(make_colour_rgb(30, 4, 4));
//}

//draw_text(xx + 3, yy + 3, str);

draw_set_colour(basecol);
draw_text(xx, yy, str);
///@param x
///@param y
///@param dir
///@param object
///@param thickness
///@param gui
///@param offset
var xx = argument[0];
var yy = argument[1];
var dir = argument[2];
var obj = argument[3];
var thickness = argument[4];
var gui = argument[5];
var off = 0;
var xx_to = 0, yy_to = 0, dist = 0, jump = 20;

if (argument_count == 7){
	off = argument[6];
}

while(!collision_line(xx, yy, xx + lengthdir_x(dist, dir), yy + lengthdir_y(dist, dir), obj, false, true)){
	dist += jump;
	
	if (dist > 2000){
		break;
	}
}

dist += off;

xx_to = xx + lengthdir_x(dist, dir);
yy_to = yy + lengthdir_y(dist, dir);

if (gui){
	if (thickness == 0){
		draw_line(xx * gui_scale_x, yy * gui_scale_y, xx_to * gui_scale_x, yy_to * gui_scale_y);
	}else{
		draw_line_width(xx * gui_scale_x, yy * gui_scale_y, xx_to * gui_scale_x, yy_to * gui_scale_y, thickness);
	}
}else{
	if (thickness == 0){
		draw_line(xx, yy, xx_to, yy_to);
	}else{
		draw_line_width(xx, yy, xx_to, yy_to, thickness);
	}
}
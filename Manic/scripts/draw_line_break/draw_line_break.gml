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
var xx_to = x, yy_to = y;
var jump = 3, xjump = lengthdir_x(jump, dir), yjump = lengthdir_y(jump, dir);
var counter = 0;

if (argument_count == 7){
	off = argument[6];
}

while(!collision_point(xx_to, yy_to, obj, false, true)){
	xx_to += xjump;
	yy_to += yjump;
	
	counter += jump;
	
	if (counter > 2000){
		break;
	}
}

xx_to += lengthdir_x(off, dir);
yy_to += lengthdir_y(off, dir);

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
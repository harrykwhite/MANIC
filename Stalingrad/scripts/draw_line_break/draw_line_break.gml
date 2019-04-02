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
var xxTo = 0, yyTo = 0, dist = 0, jump = 20;

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

xxTo = xx + lengthdir_x(dist, dir);
yyTo = yy + lengthdir_y(dist, dir);

if (gui){
	if (thickness == 0){
		draw_line(xx * GUI_SCALE_X, yy * GUI_SCALE_Y, xxTo * GUI_SCALE_X, yyTo * GUI_SCALE_Y);
	}else{
		draw_line_width(xx * GUI_SCALE_X, yy * GUI_SCALE_Y, xxTo * GUI_SCALE_X, yyTo * GUI_SCALE_Y, thickness);
	}
}else{
	if (thickness == 0){
		draw_line(xx, yy, xxTo, yyTo);
	}else{
		draw_line_width(xx, yy, xxTo, yyTo, thickness);
	}
}
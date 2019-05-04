///@param x
///@param y
///@param dir
var xx = argument0, xxs = xx;
var yy = argument1, yys = yy;
var dir = argument2;

while(onscreen(xx, yy)){
	
	xx += lengthdir_x(2, dir);
	yy += lengthdir_y(2, dir);
}

return point_distance(xxs, yys, xx, yy);
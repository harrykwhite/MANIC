///@param x1
///@param y1
///@param x2
///@param y2
///@param width
///@param object
///@param notme
var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;

var width = argument4;
var obj = argument5;
var notme = argument6;

var dir = point_direction(x1, y1, x2, y2);
var r = false;

if (width > 1){
	for(var off = 0; off < width; off ++){
	
		if (collision_line(x1 + lengthdir_x(off, dir - 90), y1 + lengthdir_y(off, dir - 90), x2 + lengthdir_x(off, dir + 90), y2 + lengthdir_y(off, dir + 90), obj, false, true)){
			r = true;
			break;
		}
	}

	for(var off = -1; off > -width; off--){
	
		if (collision_line(x1 + lengthdir_x(off, dir - 90), y1 + lengthdir_y(off, dir - 90), x2 + lengthdir_x(off, dir + 90), y2 + lengthdir_y(off, dir + 90), obj, false, true)){
			r = true;
			break;
		}
	}
}else{
	if (collision_line(x1, y1, x2, y2, obj, false, true)){
		r = true;
	}
}


return r;
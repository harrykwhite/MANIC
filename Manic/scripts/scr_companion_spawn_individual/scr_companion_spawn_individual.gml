///@param x
///@param y
///@param range
var xx = argument0;
var yy = argument1;
var range = argument2;
var vec;

var newx, newy, trials = 0;

do{
	newx = xx + random_range(-range, range);
	newy = yy + random_range(-range, range);
	
	if (trials < 200){
		trials ++;
	}else{
		break;
	}
}until(point_distance(newx, newy, xx, yy) > 20 && !collision_rectangle(xx - 30, yy - 30, xx + 30, yy + 30, obj_p_solid, false, false));

vec[0] = newx;
vec[1] = newy;

return vec;
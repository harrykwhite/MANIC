///@param x
///@param y
var xx = argument0;
var yy = argument1;
var r = 0;

if (instance_exists(obj_player)){
	r = point_distance(xx, yy, obj_player.x, obj_player.y);
}else{
	r = 10000;
}

return r;
///@param x
///@param y
var xx = argument0;
var yy = argument1;
var r = 0;

if (instance_exists(global.player)){
	r = point_distance(xx, yy, global.player.x, global.player.y);
}else{
	r = 10000;
}

return r;
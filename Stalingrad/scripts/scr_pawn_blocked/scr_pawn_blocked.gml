///@param x
///@param y
var xx = argument0;
var yy = argument1;
var ret = true;

if (instance_exists(global.player)){
	if (!collision_line(xx, yy, global.player.x, global.player.y, obj_p_solid, false, true)){
		ret = false;
	}
}

return ret;
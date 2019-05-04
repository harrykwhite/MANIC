///@param x
///@param y
var xx = argument0;
var yy = argument1;
var ret = true;

if (instance_exists(obj_player)){
	if (!collision_line(xx, yy, obj_player.x, obj_player.y, obj_p_solid, false, true)){
		ret = false;
	}
}

return ret;
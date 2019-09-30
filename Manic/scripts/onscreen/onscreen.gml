///@param x
///@param y
///@param offset
var xx = argument0;
var yy = argument1;
var off = argument2;
var ret = false;

with(obj_controller_all){
	if (xx >= camera_get_x1 + off){
		if (yy >= camera_get_y1 + off){
			if (xx <= camera_get_x2 - off){
				if (yy <= camera_get_y2 - off){
					ret = true;
				}
			}
		}
	}
}

return ret;
///@param x
///@param y
///@param offset
var xx = argument[0];
var yy = argument[1];
var off = 0;
var ret = false;

if (argument_count > 2){
	off = argument[2];
}

with(obj_controller_all){
	ret = (xx >= camera_get_x1 + off) && (yy >= camera_get_y1 + off) && (xx <= camera_get_x2 - off) && (yy <= camera_get_y2 - off);
}

return ret;
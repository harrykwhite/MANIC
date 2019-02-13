///@param x
///@param y
///@param offset
var xx = argument[0];
var yy = argument[1];
var off = 0;
var r = false;

if (argument_count > 2){
	off = argument[2];
}

var camx1 = camera_get_view_x(view_camera[0]);
var camy1 = camera_get_view_y(view_camera[0]);

var camx2 = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]);
var camy2 = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]);

if (within(xx, camx1 + off, camx2 - off)) && (within(yy, camy1 + off, camy2 - off)){
	r = true;
}

return r;
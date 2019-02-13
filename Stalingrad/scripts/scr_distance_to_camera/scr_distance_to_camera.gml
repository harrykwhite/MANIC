///@param x
///@param y
var xx = argument0;
var yy = argument1;

return point_distance(xx, yy,
camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2),
camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) / 2),
);
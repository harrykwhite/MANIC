///@param world_position_x
var world_position_x = argument0;

world_position_x -= camera_get_view_x(view_camera[0]);
world_position_x *= gui_scale_x;

return floor(world_position_x);
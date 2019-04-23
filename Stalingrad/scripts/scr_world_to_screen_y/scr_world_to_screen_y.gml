///@param world_position_y
var world_position_y = argument0;

world_position_y -= camera_get_view_y(view_camera[0]);
world_position_y *= gui_scale_y;

return floor(world_position_y);
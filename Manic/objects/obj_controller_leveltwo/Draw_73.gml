var basealpha = 0.05;
var drawalpha = basealpha;

if (room == rm_level_2_pre_00){
	drawalpha *= (camera_get_view_x(view_camera[0]) / room_width);
}

draw_set_colour(c_orange);
draw_set_alpha(drawalpha);
draw_rectangle(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), false);
draw_set_alpha(1);
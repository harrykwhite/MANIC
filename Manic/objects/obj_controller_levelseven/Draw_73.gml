var alpha = 0.06;

draw_set_colour(c_ltgray);
draw_set_alpha(alpha);
draw_rectangle(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), false);
draw_set_alpha(1);

if (room == rm_level_7_post_00){
	draw_set_colour(c_black);
	draw_set_alpha(0.05 * mean(camera_get_view_x(view_camera[0]) / room_width, 1 - (camera_get_view_y(view_camera[0]) / room_height)));
	draw_rectangle(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), false);
	draw_set_alpha(1);
}
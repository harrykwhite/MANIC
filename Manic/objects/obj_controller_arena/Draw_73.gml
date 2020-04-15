var alpha, colour;

switch(room){
	case rm_arena_1_00:
		alpha = 0.05;
		colour = c_orange;
		break;
	
	case rm_arena_2_00:
		alpha = 0.04;
		colour = c_ltgray;
		break;
}

draw_set_alpha(alpha);
draw_set_colour(colour);
draw_rectangle(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), false);
draw_set_alpha(1);
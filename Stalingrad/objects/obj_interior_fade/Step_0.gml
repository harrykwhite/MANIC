if (update_time > 0){
	update_time--;
}else{
	fade = false;
	
	if (y >= camera_get_view_y(view_camera[0])) && (y + sprite_height <= camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])){
		if (x >= camera_get_view_x(view_camera[0])) && (x + sprite_width <= camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])){
			if (collision_rectangle(x + innerspace, y + innerspace, (x + sprite_width) - innerspace, (y + sprite_height) - innerspace, obj_p_pawn, false, true)){
				fade = true;
			}
		}
	}
	
	update_time = update_time_max;
}
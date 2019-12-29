if (global.pers_runthrough){
	instance_deactivate_object(object_index);
	return;
}

camera_radius = 0;

camera_screenshake = false;
camera_screenshake_amount = 0;

camera_move_to_player = false;
camera_move_to_player_time = 4;

camera_zoom = 1;
camera_zoom_to = 1;
camera_zoom_add = 0;
camera_zoom_width = ceil(basewidth / global.game_option[| Options.CameraScale]);
camera_zoom_height = ceil(baseheight / global.game_option[| Options.CameraScale]);
camera_zoom_offset = 0;
camera_zoom_offset_real = 0;

autocontrol = true;
dir = 0;
spd = 0;
len = 0;

sprite_index = noone;
camera_set_view_size(view_camera[0], camera_zoom_width, camera_zoom_height);
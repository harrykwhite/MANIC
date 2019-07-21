camera_radius = 0;

camera_screenshake = false;
camera_screenshake_amount = 0;

camera_move_to_player = false;
camera_move_to_player_time = 4;

camera_zoom = 1;
camera_zoom_to = 1;
camera_zoom_add = 0;
camera_zoom_width = camera_get_view_width(view_camera[0]);
camera_zoom_height = camera_get_view_height(view_camera[0]);

autocontrol = true;
dir = 0;
spd = 0;
len = 0;

sprite_index = noone;
camera_set_view_size(view_camera[0], ceil(720 / global.game_option[| Options.CameraScale]), ceil(405 / global.game_option[| Options.CameraScale]));
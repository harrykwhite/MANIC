camera_radius = 0;

camera_screenshake = false;
camera_screenshake_amount = 0;

camera_move_to_player = false;
camera_move_to_player_time = 4;

autocontrol = true;
dir = 0;
spd = 0;
len = 0;

sprite_index = noone;
camera_set_view_size(view_camera[0], 720 / global.game_option[| Options.CameraScale], 405 / global.game_option[| Options.CameraScale]);
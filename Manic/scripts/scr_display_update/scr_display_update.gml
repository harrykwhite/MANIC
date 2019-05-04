var fullscreen = window_get_fullscreen();

var ideal_width = 0;
var ideal_height = 800;

var dwidth = scr_resolution_get(global.game_option[| Options.Resolution], true);
var dheight = scr_resolution_get(global.game_option[| Options.Resolution], false);

if (!fullscreen){
	dwidth = display_get_width();
	dheight = display_get_height();
}

var aspect_ratio = dwidth / dheight;

ideal_width = round(ideal_height * aspect_ratio);

if (dwidth mod ideal_width != 0){
	var d = round(dwidth / ideal_width);
	ideal_width = dwidth / d;
}

if (dheight mod ideal_height != 0){
	var d = round(dheight / ideal_height);
	ideal_height = dheight / d;
}

if (ideal_width & 1){
	ideal_width ++;
}

if (ideal_height & 1){
	ideal_height ++;
}

var room_count = room_last;

for(var i = 0; i < room_count; i ++){
	if (room_exists(i)){
		room_set_viewport(i, 0, true, 0, 0, ideal_width, ideal_height);
	}
}

var window_width = ideal_width;
var window_height = ideal_height;

if (!fullscreen){
	window_width /= 3;
	window_height /= 3;
	
	window_width *= global.game_option[| Options.WindowScale];
	window_height *= global.game_option[| Options.WindowScale];
}

surface_resize(application_surface, window_width / global.game_option[| Options.CameraScale], window_height / global.game_option[| Options.CameraScale]);
window_set_size(window_width, window_height);
display_set_gui_size(ideal_width / global.game_option[| Options.UIScale], ideal_height / global.game_option[| Options.UIScale]);
camera_set_view_size(view_camera[0], 720 / global.game_option[| Options.CameraScale], 405 / global.game_option[| Options.CameraScale]);

obj_controller_all.center_window_time = 2;
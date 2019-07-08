var fullscreen = global.game_option[| Options.Fullscreen];

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
	room_set_viewport(i, 0, true, 0, 0, ideal_width, ideal_height);
}

var window_width = ideal_width;
var window_height = ideal_height;

var camscale = global.game_option[| Options.CameraScale];
var winscale = global.game_option[| Options.WindowScale];
var uiscale = global.game_option[| Options.UIScale];

if (!fullscreen){
	window_width /= 3;
	window_height /= 3;
	
	window_width *= winscale;
	window_height *= winscale;
	
	window_set_size(window_width, window_height);
}

display_set_gui_size(ideal_width / uiscale, ideal_height / uiscale);
camera_set_view_size(view_camera[0], 720 / camscale, 405 / camscale);
display_reset(0, false);

//if ((surface_get_width(application_surface) != window_width / camscale) || (surface_get_height(application_surface) != window_height / camscale)){
//	obj_controller_all.app_surf_refresh_time = 0;
//	obj_controller_all.app_surf_refresh_w = window_width / camscale;
//	obj_controller_all.app_surf_refresh_h = window_height / camscale;
//}

obj_controller_all.center_window_time = 2;
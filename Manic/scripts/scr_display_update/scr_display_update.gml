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

if (camscale < 1){
	camscale = 1;
	global.game_option[| Options.CameraScale] = 1;
}

if (winscale < 1){
	winscale = 3;
	global.game_option[| Options.WindowScale] = 3;
}

if (uiscale < 1){
	uiscale = 1;
	global.game_option[| Options.UIScale] = 1;
}

if (!fullscreen){
	window_width /= 3;
	window_height /= 3;
	
	window_width *= winscale;
	window_height *= winscale;
	
	window_set_size(window_width, window_height);
}

obj_controller_all.gui_resize_w = ideal_width / uiscale;
obj_controller_all.gui_resize_h = ideal_height / uiscale;
obj_controller_all.gui_resize_time = 2;

obj_controller_all.camera_resize_w = 720 / camscale;
obj_controller_all.camera_resize_h = 405 / camscale;
obj_controller_all.camera_resize_time = 1;

display_reset(0, false);
surface_resize(application_surface, 720, 405);

obj_controller_all.center_window_time = 2;
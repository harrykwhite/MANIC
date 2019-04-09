var ideal_width = 0;
var ideal_height = 800;

var dwidth = scr_resolution_get(global.game_option[| Options.Resolution], true);
var dheight = scr_resolution_get(global.game_option[| Options.Resolution], false);

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

surface_resize(application_surface, ideal_width, ideal_height);
display_set_gui_size(ideal_width, ideal_height);
window_set_size(ideal_width, ideal_height);
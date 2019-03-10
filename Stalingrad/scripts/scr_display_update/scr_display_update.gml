var ideal_width = 0;
var ideal_height = 800;
var aspect_ratio = display_get_width() / display_get_height();

ideal_width = round(ideal_height * aspect_ratio);

if (display_get_width() mod ideal_width != 0){
	var d = round(display_get_width() / ideal_width);
	ideal_width = display_get_width() / d;
}

if (display_get_height() mod ideal_height != 0){
	var d = round(display_get_height() / ideal_height);
	ideal_height = display_get_height() / d;
}

if (ideal_width & 1){
	ideal_width++;
}

if (ideal_height & 1){
	ideal_height++;
}

var room_count = room_last;

for(var i = 0; i < room_count; i++){
	if (room_exists(i)){
		room_set_viewport(i, 0, true, 0, 0, ideal_width, ideal_height);
	}
}

surface_resize(application_surface, ideal_width, ideal_height);
display_set_gui_size(ideal_width * 1.5, ideal_height * 1.5);
window_set_size(ideal_width, ideal_height);
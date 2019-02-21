scr_part_setup();

ds_depth_grid = ds_grid_create(4, 1);
ds_depth_count = 0;
ds_depth_num = 0;

full = 0;
part = 0;
wsize = 2;
wsize_time = 10;

debug = false;
sprite_index = noone;

ini_open("config.ini");
window_set_fullscreen(ini_read_real("DISPLAY", "fullscreen", true));
wsize = 2//ini_read_real("DISPLAY", "windowScale", 2);
ini_close();

if (!window_get_fullscreen()){
	window_set_size(720 * wsize, 405 * wsize);
	window_set_position((display_get_width() / 2) - ((720 * wsize) / 2), (display_get_height() / 2) - ((405 * wsize) / 2))
	display_set_gui_size(720 * 2.5, floor(405 * 2.5));
}
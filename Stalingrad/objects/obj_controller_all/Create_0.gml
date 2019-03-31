scr_part_setup();

ds_depth_grid_height = 1200;
ds_depth_grid = ds_grid_create(2, ds_depth_grid_height);
ds_depth_counter = 0;

full = 0;
part = 0;
wsize = 2;

debug = false;
sprite_index = noone;

ini_open("config.ini");
window_set_fullscreen(ini_read_real("DISPLAY", "fullscreen", true));
ini_close();

scr_display_update();
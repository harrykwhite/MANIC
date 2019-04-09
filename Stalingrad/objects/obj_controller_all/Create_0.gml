scr_part_setup();
scr_option_init();

ds_depth_grid_height = 1200;
ds_depth_grid = ds_grid_create(2, ds_depth_grid_height);
ds_depth_counter = 0;

full = 0;
part = 0;
//wsize = 2;

debug = false;
sprite_index = noone;

window_set_fullscreen(global.game_option[| Options.Fullscreen]);
scr_display_update();
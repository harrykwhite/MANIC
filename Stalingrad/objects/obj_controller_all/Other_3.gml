part_system_destroy(global.ps_front);
part_system_destroy(global.ps_bottom);

if (ds_exists(ds_depth_grid, ds_type_grid)){
	ds_grid_destroy(ds_depth_grid);
}

if (ds_exists(global.player_upgrades, ds_type_list)){
	ds_list_destroy(global.player_upgrades);
}

ini_open("config.ini");
ini_write_real("DISPLAY", "fullscreen", window_get_fullscreen());
ini_write_real("DISPLAY", "windowScale", wsize);
ini_close();
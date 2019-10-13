if (room != rm_ini) && (room != rm_title_0){
	if (global.game_is_playthrough){
		scr_save_game();
	}
}

scr_options_refresh(false);

part_system_destroy(global.ps_front);
part_system_destroy(global.ps_bottom);

if (ds_exists(ds_depth_grid, ds_type_grid)){
	ds_grid_destroy(ds_depth_grid);
}

if (ds_exists(global.game_option, ds_type_list)){
	ds_list_destroy(global.game_option);
}

if (ds_exists(global.player_companions, ds_type_grid)){
	ds_grid_destroy(global.player_companions);
}

if (ds_exists(global.level_collectable_found, ds_type_grid)){
	ds_grid_destroy(global.level_collectable_found);
}

if (ds_exists(global.level_turret_killed, ds_type_grid)){
	ds_grid_destroy(global.level_turret_killed);
}
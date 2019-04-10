ini_open("save.ini");

if (global.level_current > global.game_save_level){
	global.game_save_level = global.level_current;
	ini_write_real("Save", "LevelAt", global.game_save_level);
}

ini_write_real("Save", "Started", global.game_save_started);
ini_write_real("Save", "Seconds", global.game_save_seconds);

if (ds_exists(global.player_companions, ds_type_grid)){
	var upgradecount = array_length_1d(global.upgrade_name);
	for(var i = 0; i < upgradecount; i ++){
		var unlocked = scr_player_has_upgrade(i);
	
		global.game_save_upgrade_unlocked[i] = unlocked;
		ini_write_real("Save", "Upgrade" + string(i), unlocked);
	}
}

ini_close();
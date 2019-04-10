ini_open("save.ini");
global.game_save_started = ini_read_real("Save", "Started", false);
global.game_save_level = ini_read_real("Save", "LevelAt", 0);
global.game_save_seconds = ini_read_real("Save", "Seconds", 0);

var upgradecount = array_length_1d(global.upgrade_name);
for(var i = 0; i < upgradecount; i ++){
	global.game_save_upgrade_unlocked[i] = ini_read_real("Save", "Upgrade" + string(i), false);
}

ini_close();
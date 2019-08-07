var upgradecount = array_length_1d(global.upgrade_name);

for(var i = 0; i < upgradecount; i ++){
	global.upgrade_equipped[i] = false;
}

scr_player_upgrade_refresh();
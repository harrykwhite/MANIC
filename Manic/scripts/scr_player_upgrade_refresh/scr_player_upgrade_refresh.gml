var upgradecount = array_length_1d(global.upgrade_name);

with(obj_player){
	for(var i = 0; i < upgradecount; i ++){
		upgrade_has[i] = scr_player_has_upgrade(i);
	}
}
if (global.game_pause) || (global.cutscene_current != -1){
	return;
}

scr_ammo_update(AmmoType.Shells, 0.12, 2);
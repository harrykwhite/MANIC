if (global.game_pause) || (global.cutscene_current != -1){
	return;
}

scr_ammo_update(AmmoType.Bullets, 0.2, 4);
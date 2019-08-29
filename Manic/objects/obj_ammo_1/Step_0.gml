if (global.game_pause) || (global.cutscene_current != -1){
	return;
}

scr_ammo_update(AmmoType.Fuel, 0.125, 2.5);
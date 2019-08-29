if (global.game_pause) || (global.cutscene_current != -1){
	return;
}

scr_ammo_update(AmmoType.Explosives, 0.145, 2.5);
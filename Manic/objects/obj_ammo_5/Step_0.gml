if (global.game_pause) || (global.cutscene_current != -1){
	image_speed = 0;
	return;
}

image_speed = 1;

scr_ammo_update(AmmoType.Shells, 0.12, 2);
if (global.game_pause) || (global.cutscene_current != -1){
	image_speed = 0;
	return;
}

image_speed = 1;

scr_ammo_update(AmmoType.Fuel, 0.125, 2.5);
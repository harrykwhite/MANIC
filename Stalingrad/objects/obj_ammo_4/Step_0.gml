if (global.game_pause){
	image_speed = 0;
	return;
}

image_speed = 1;
scr_ammo_update(AmmoType.Darts, 0.145, 2.5);
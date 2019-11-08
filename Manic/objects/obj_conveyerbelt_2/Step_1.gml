if (timemaxoriginal == noone){
	timemaxoriginal = timemax;
}

if (!checked){
	if (global.game_conveyerbelt_shutdown0 && index == 0)
	|| (global.game_conveyerbelt_shutdown1 && index == 1)
	|| (global.game_conveyerbelt_shutdown2 && index == 2)
	|| (global.game_conveyerbelt_shutdown3 && index == 3){
		deactivated = true;
		scr_conveyerbelt_shutdown_group(true);
	}
	
	checked = true;
}
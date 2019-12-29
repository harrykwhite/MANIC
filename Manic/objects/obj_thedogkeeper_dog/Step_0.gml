var ispaused = false;
if (global.game_pause){
	ispaused = true;
}

if (ispaused){
	if (abs(image_xscale) != scale) || (abs(image_yscale) != scale){
		image_xscale = sign(image_xscale) * scale;
		image_yscale = scale;
	}
	
	image_speed = 0;
	return;
}

if (instance_exists(keeper)){
	cutscene_prop = keeper.cutscene_prop;
}

scr_pawn_status_handler();

if (global.cutscene_current == -1) || (cutscene_prop){
	scr_thedogkeeper_dog_behaviour_0();
}else{
	image_speed = 0;
}

if (!instance_exists(keeper)){
	health_current = 0;
}

scr_pawn_update();
image_yscale = scale;
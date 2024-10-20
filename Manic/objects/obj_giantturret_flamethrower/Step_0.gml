var ispaused = false;

if (global.game_pause){
	ispaused = true;
}

if (instance_exists(turret)){
	if (!turret.active){
		ispaused = true;
	}
	
	cutscene_prop = turret.cutscene_prop;
}

if (global.cutscene_current != -1){
	if (!in_cutscene){
		ispaused = true;
	}
}else{
	if (cutscene_prop){
		ispaused = true;
	}
}

if (ispaused){
	if (abs(image_xscale) != scale) || (abs(image_yscale) != scale){
		image_xscale = sign(image_xscale) * scale;
		image_yscale = scale;
	}
	
	image_speed = 0;
	return;
}

poison = false;
bleed = false;
headless = false;

scr_pawn_status_handler();
scr_giantturret_flamethrower_0();
scr_pawn_update();
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

scr_pawn_status_handler();

if (global.cutscene_current == -1) || (cutscene_prop){
	if (headless){
		scr_enemy_2_behaviour_headless() 
	}else if (burn){
		scr_enemy_2_behaviour_burn();
	}else{
		scr_enemy_2_behaviour();
	}
}else{
	image_speed = 0;
}

scr_pawn_update();
image_yscale = scale;
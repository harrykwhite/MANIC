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

whiteflash_alpha -= whiteflash_alphadec;
whiteflash_alpha = clamp(whiteflash_alpha, 0, 1);

headless = false;

scr_pawn_status_handler();

if (global.cutscene_current == -1) || (cutscene_prop){
	scr_enemy_5_behaviour();
}else{
	image_speed = 0;
}

if (!onscreen(x, y, -36)){
	if (offscreen_timer < 60 * 4){
		offscreen_timer ++;
	}else{
		instance_destroy();
	}
}else{
	offscreen_timer = 0;
}

scr_pawn_update();
image_yscale = scale;
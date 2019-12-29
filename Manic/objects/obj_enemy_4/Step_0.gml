var ispaused = false;
if (global.game_pause){
	ispaused = true;
}

if (ispaused){
	if (abs(image_xscale) != scale) || (abs(image_yscale) != scale){
		image_xscale = sign(image_xscale) * scale * scale_mult_x;
		image_yscale = scale;
	}
	
	image_speed = 0;
	return;
}

if (contact_attack_ready_time > 0){
	contact_attack_ready_time --;
}

scr_pawn_status_handler();

if (global.cutscene_current == -1) || (cutscene_prop){
	scr_enemy_4_behaviour();
}else{
	image_speed = 0;
}

scr_pawn_update();
image_yscale = scale * scale_mult_y;

scale_mult_x = approach(scale_mult_x, 1, 15);
scale_mult_y = approach(scale_mult_y, 1, 15);
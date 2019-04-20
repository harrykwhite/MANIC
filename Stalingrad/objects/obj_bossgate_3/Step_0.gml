if (!open){
	sprite_index = spr_bossgate_3_closed;
}else{
	sprite_index = spr_bossgate_3_open;
	
	if (open_anim){
		image_speed = 1;
	}else{
		image_speed = 0;
		image_index = image_number - 1;
	}
}
if (!closed){
	sprite_index = spr_bossgate_2_open;
}else{
	sprite_index = spr_bossgate_2_closed;
	
	if (closed_anim){
		image_speed = 1;
	}else{
		image_speed = 0;
		image_index = image_number - 1;
	}
}
if (global.game_pause){
	image_speed = 0;
	return;
}

if (bend){
	sprite_index = spr_grass_small_1_bent;
	
	bend = false;
	time = 25;
}else{
	if (time > 0){
		sprite_index = spr_grass_small_1_bent;
		time--;
	}else{
		sprite_index = spr_grass_small_1;
	}
}
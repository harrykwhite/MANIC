if (global.game_pause){
	image_speed = 0;
	exit;
}

if (bend == true){
	sprite_index = spr_grass_small_0_bent;
	if (time <= 0){
		shake = 1;
	}
	
	bend = false;
	time = 25;
}else{
	if (time > 0){
		sprite_index = spr_grass_small_0_bent;
		time--;
	}else{
		sprite_index = spr_grass_small_0;
	}
}

if (shake > 0){
    x = xstart + random_range(-shake, shake);
    y = ystart + random_range(-shake, shake);
    shake *= 0.9;
}
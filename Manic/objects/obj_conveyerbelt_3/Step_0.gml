if (global.game_pause){
	image_speed = 0;
}

if (stop){
	if (spd > 0){
		spd -= 0.0075;
	}else{
		spd = 0;
	}
}

image_speed = spd;
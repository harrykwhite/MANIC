if (global.game_pause){
	image_speed = 0;
	return;
}

// Spawning
if (spawn) && (!stop){
	if (time < timemax){
		time ++;
	}else{
		time = 0;
		instance_create(x + 20, y + 7, spawn_object);
	}
}
if (global.game_pause){
	return;
}

// Motion
image_angle += spd * 2.5;

spd *= 0.9;
spd = max(spd, 0);

if (spd > 0.01){
	if (!place_meeting(x + lengthdir_x(spd, dir), y + lengthdir_y(spd, dir), obj_p_solid)){
		x += lengthdir_x(spd, dir);
		y += lengthdir_y(spd, dir);
	}else{
		spd = 0;
	}
}else{
	spd = 0;
}
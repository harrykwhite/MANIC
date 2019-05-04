if (spd > 0.1){
	if (!place_meeting(x + lengthdir_x(spd, dir), y + lengthdir_y(spd, dir), obj_p_solid)){
		x += lengthdir_x(spd, dir);
		y += lengthdir_y(spd, dir);
	}else{
		spd = 0;
	}
	
	image_angle += spd * 3;
	spd *= 0.9;
}else{
	spd = 0;
}

if (time > 0){
	time --;
}else{
	if (image_alpha > 0){
		image_alpha -= 0.05;
	}else{
		instance_destroy();
	}
}
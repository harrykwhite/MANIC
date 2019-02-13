if (global.game_pause){
	exit;
}

if (rspd > 0){
	if (!place_meeting(x + lengthdir_x(rspd + 2, dir), y + lengthdir_y(rspd + 2, dir), obj_p_solid)){
		x += lengthdir_x(rspd, dir);
		y += lengthdir_y(rspd, dir);
	
		if (time > 0){
			time --;
		}else{
			spd = choose(0, random(1.6));
			time = random_range(60, 120);
		}
	}else{
		rspd = 0;
	}
}

if (rspd < spd){
	rspd += acc;
}else if (rspd > spd){
	rspd -= acc;
}

if (life > 0){
	life --;
	
	if (image_alpha < 1){
		image_alpha += 0.1;
	}
	
}else{
	if (image_alpha > 0){
		image_alpha -= 0.05;
	}else{
		instance_destroy();
	}
}

if (dir == 180){
	image_angle += rspd * 5;
}else{
	image_angle -= rspd * 5;
}
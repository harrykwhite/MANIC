if (global.game_pause){
	exit;
}

if (rspd > 0){
	x += dir * rspd;
	
	if (time > 0){
		time --;
	}else{
		spd = choose(0, random(1.6));
		time = random_range(60, 120);
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

image_angle += rspd * 5 * dir;
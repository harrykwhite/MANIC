if (global.game_pause){
	return;
}

var xvel = spd * dir;

if (place_meeting(x + xvel, y, obj_p_solid)){
	xvel = 0;
	spd = 0;
}

x += xvel;
image_speed = xvel * -0.1;

if (life > 0){
	life --;
	
	if (image_alpha < 1){
		image_alpha += 0.05;
	}
}else{
	if (image_alpha > 0){
		image_alpha -= 0.05;
	}else{
		instance_destroy();
	}
}
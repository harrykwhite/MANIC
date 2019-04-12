if (global.game_pause){
	image_speed = 0;
	return;
}

image_speed = 0.1;
x += spd * dir;

if (dir == 1){
	image_xscale = 1;
}else{
	image_xscale = -1;
}
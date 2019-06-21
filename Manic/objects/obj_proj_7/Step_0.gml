if (global.game_pause){
	image_speed = 0;
	return;
}

x += lengthdir_x(spd, dir);
y += lengthdir_y(spd, dir);
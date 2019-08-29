if (global.game_pause) || (enemy && global.cutscene_current != -1){
	image_speed = 0;
	return;
}

x += lengthdir_x(spd, dir);
y += lengthdir_y(spd, dir);
if (global.game_pause){
	image_speed = 0;
	return;
}

image_speed = 1.5;

dir += dir_wiggle * choose(1, -1);
if (dir <= 90) || (dir >= 270){
	image_xscale = 1;
}else{
	image_xscale = -1;
}

x += lengthdir_x(spd, dir);
y += lengthdir_y(spd, dir);
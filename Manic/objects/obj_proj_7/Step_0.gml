if (global.game_pause){
	image_speed = 0;
	return;
}

if (collision_line(xprevious, yprevious, x + lengthdir_x(4, dir), y + lengthdir_y(4, dir), obj_p_solid, false, true)){
	instance_destroy();
}

x += lengthdir_x(spd, dir);
y += lengthdir_y(spd, dir);
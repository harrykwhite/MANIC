if (global.game_pause){
	image_speed = 0;
	return;
}

if (collision_line(xstart, ystart, x + lengthdir_x(8, dir), y + lengthdir_y(8, dir), obj_p_solid, true, true)){
	instance_destroy();
}

damage += damage_change;
damage = max(damage, 1);
x += lengthdir_x(spd, dir);
y += lengthdir_y(spd, dir);
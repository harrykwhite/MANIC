if (global.game_pause){
	image_speed = 0;
	return;
}

if (owner != noone){
	if (!instance_exists(owner)){
		instance_destroy();
		return;
	}
	
	spd = 0;
	damage = false;
	x = owner.x - owner_offset_x;
	y = owner.y - owner_offset_y;
	
}else{
	if (collision_line(xstart, ystart, x + lengthdir_x(4, dir), y + lengthdir_y(4, dir), obj_p_solid, true, true)){
		instance_destroy();
	}

	x += lengthdir_x(spd, dir);
	y += lengthdir_y(spd, dir);
}
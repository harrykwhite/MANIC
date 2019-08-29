if (global.game_pause) || (enemy && global.cutscene_current != -1){
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
	x += lengthdir_x(spd, dir);
	y += lengthdir_y(spd, dir);
}
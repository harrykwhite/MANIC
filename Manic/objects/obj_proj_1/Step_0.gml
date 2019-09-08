if (global.game_pause){
	image_speed = 0;
	return;
}

if (instance_exists(owner_inst)){
	x = owner_inst.x + owner_offset_x;
	y = owner_inst.y + owner_offset_y;
}

image_speed = 3.5 * (1.5);
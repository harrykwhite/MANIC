if (global.game_pause) || (global.cutscene_current != -1){
	image_speed = 0;
	return;
}

if (domove){
	var dirblock = instance_place(x, y, obj_block_direction);
	if (dirblock != noone){
		dir_to = dirblock.image_angle;
	}
	
	var dirdiff = angle_difference(dir, dir_to);
	dir += min(abs(dirdiff), 6) * -sign(dirdiff);
	
	if (dir_to < 90) || (dir_to > 270){
		facing = 1;
	}else{
		facing = -1;
	}
	
	image_speed = 0.24;
	sprite_index = spr_prisoner_walk_0;
	x += lengthdir_x(spd, dir);
	y += lengthdir_y(spd, dir);
}else{
	image_speed = 0.05;
	sprite_index = spr_prisoner_idle_0;
}

image_xscale = facing * scale;
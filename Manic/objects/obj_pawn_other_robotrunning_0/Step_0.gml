if (global.game_pause){
	image_speed = 0;
	return;
}

if (onscreen(x, y, -40)){
	domove = true;
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
	
	image_speed = 0.325;
	sprite_index = spr_enemy_0_walk_1;
	
	x += lengthdir_x(spd, dir);
	y += lengthdir_y(spd, dir);
}else{
	image_speed = 0.05;
	sprite_index = spr_enemy_0_idle_1;
}

image_xscale = facing * scale;
if (global.game_pause) || (global.cutscene_current != -1){
	if (owner.object_index == obj_enemy_0){
		if (!owner.fly_cutscene_prop){
			image_speed = 0;
			exit;
		}
	}else{
		image_speed = 0;
		exit;
	}
}

image_speed = 1;
livetime++;

whiteflash_alpha -= whiteflash_alphadec;
whiteflash_alpha = clamp(whiteflash_alpha, 0, 1);

if (distance_to_point(move_xTo, move_yTo) < 10) || (move_time <= 0){
	if (owner == noone) || (!instance_exists(owner)){
		if (instance_exists(global.player)){
			owner = global.player;
			move_speed *= random_range(0.675, 0.8);
		}
	}
	
	if (instance_exists(owner) && (owner != noone)){
		if (owner == global.player){
			move_xTo = owner.x + random_range(-18, 18);
			move_yTo = owner.y + random_range(-18, 18);
		}else{
			move_xTo = owner.x + random_range(-30, 30);
			move_yTo = owner.y + random_range(-30, 30);
		}
	}else{
		move_xTo = x + choose(-40, 40, -30, 30);
		move_yTo = y + choose(-40, 40, -30, 30);
	}
	
	move_time = random_range(30, 50);
}else{
	var dir = point_direction(x, y, move_xTo, move_yTo);
	x += lengthdir_x(move_speed, dir);
	y += lengthdir_y(move_speed, dir);
	
	move_time --;
}

scr_pawn_update();
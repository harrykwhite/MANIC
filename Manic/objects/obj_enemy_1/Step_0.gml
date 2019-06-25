var ispaused = false;
if (global.game_pause){
	ispaused = true;
}

if (ispaused){
	if (owner.object_index == obj_enemy_0){
		if (!owner.cutscene_prop){
			image_speed = 0;
			return;
		}
	}else{
		image_speed = 0;
		return;
	}
}

if (instance_exists(obj_player)) && (!global.game_pause){
	if (distance_to_object(obj_player) < 60){
		if (buzz == noone){
			buzz = scr_sound_play(snd_other_fly_0, true, 1, 1);
		}
		scr_sound_set_distance(buzz, 60);
	}else{
		if (audio_is_playing(buzz)){
			audio_stop_sound(buzz);
			buzz = noone;
		}
	}
}else{
	if (audio_is_playing(buzz)){
		audio_stop_sound(buzz);
		buzz = noone;
	}
}

image_speed = 1;

whiteflash_alpha -= whiteflash_alphadec;
whiteflash_alpha = clamp(whiteflash_alpha, 0, 1);

if ((distance_to_point(move_x_to, move_y_to) < 10) || (move_time <= 0)) && (onscreen(x, y, -10)){
	if (owner == noone) || (!instance_exists(owner)){
		if (instance_exists(obj_player)){
			owner = obj_player;
			move_speed *= random_range(0.675, 0.8);
		}else{
			move_x_to = x + choose(-40, 40, -40, 40);
			move_y_to = y + choose(-40, 40, -40, 40);
		}
	}else{
		if (owner == obj_player){
			move_x_to = owner.x + random_range(-18, 18);
			move_y_to = owner.y + random_range(-18, 18);
		}else{
			move_x_to = owner.x + random_range(-30, 30);
			move_y_to = owner.y + random_range(-30, 30);
		}
	}
	
	move_time = random_range(30, 50);
}else{
	var dir = point_direction(x, y, move_x_to, move_y_to);
	x += lengthdir_x(move_speed, dir);
	y += lengthdir_y(move_speed, dir);
	
	move_time --;
}

poison = false;
bleed = false;

if (attack_ready_time > 0){
	attack_ready_time --;
}

scr_pawn_status_handler();
scr_pawn_update();
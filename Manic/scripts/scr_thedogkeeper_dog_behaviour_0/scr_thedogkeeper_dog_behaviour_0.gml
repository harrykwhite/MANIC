var speed_multiplier = 1;
var speed_final = 0;
var face_player = true;
target = obj_player;

if (instance_exists(target)) && (instance_exists(keeper)){
	leash_dir = keeper.move_dir;
	
	if (distance_to_object(target) < leash_length){
		leash_dir = point_direction(x, y, target.x, target.y + 6);
	}
	
	move_x_to = keeper.x + lengthdir_x(leash_length + leash_length_offset + 20, leash_dir + leash_offset);
	move_y_to = keeper.y + lengthdir_y(leash_length + leash_length_offset + 20, leash_dir + leash_offset);
	
	if (leash_bite){
		var dirToTarget = point_direction(x, y, target.x, target.y);
		speed_multiplier += 1.6;
		move_x_to = target.x + lengthdir_x(38, dirToTarget);
		move_y_to = target.y + lengthdir_y(38, dirToTarget);
		
		if (attack_active_time > 0){
			attack_active_time --;
		}else{
			leash_bite = false;
			leash_bite_retreat = true;
		}
	}else if (leash_bite_retreat){
		leash_length_offset = -20;
		speed_multiplier += 1.3;
	}else{
		if (distance_to_point(target.x, target.y + 6) < 200){
			if (bark_time > 0){
				bark_time--;
			}else{
				scr_sound_play_distance(snd_character_bark_0, false, 300);
				bark_time = random_range(140, 260);
			}
		}
		
		if (!keeper.cutscene_prop && !keeper.in_cutscene){
			if (attack_time > 0){
				attack_time --;
			}else{
				leash_bite = true;
				attack_active_time = 75;
				attack_time = random_range(30, 45);
			}
		}
		
		leash_length_offset  = 0;
	}
	
	if (distance_to_point(move_x_to, move_y_to) > 14){
		move_speed = 1.5;
	}else{
		move_speed = 0;
		
		if (leash_bite){
			leash_bite = false;
			leash_bite_retreat = true;
		}
		
		if (leash_bite_retreat){
			leash_bite = false;
			leash_bite_retreat = false;
		}
	}
}else{
	move_speed = 0;
	face_player = false;
}

// Moving
speed_final = move_speed * speed_multiplier * move_speed_offset;

if (move_speed_real < speed_final){
    move_speed_real += 0.2;
}else if (move_speed_real > speed_final){
    move_speed_real -= 0.2;
}

if (!scr_pawn_find_path()){
	move_speed_real = 0;
	speed_final = 0;
}

// Facing
if (!face_player){
	if (move_x_to > x){
		image_xscale = scale;
	}else{
		image_xscale = -scale;
	}
}else{
	if (target.x > x){
		image_xscale = scale;
	}else{
		image_xscale = -scale;
	}
}

// Animation
if (speed_final > 0.5) || (idleanim_time > 0){
	sprite_index = spr_thedogkeeper_dog_walk_0;
	
	if (idleanim_time == -1){
		idleanim_time = 10;
	}
	
	if (idleanim_time > 0){
		idleanim_time --;
	}
}else{
	idleanim_time = -1;
	sprite_index = spr_thedogkeeper_dog_idle_0;
}

if (speed_final <= 0.1) || (!instance_exists(target)) || ((x == xprevious) && (y == yprevious)){
    image_speed = 0.05;
}else{
	image_speed = (speed_final * 0.165);
}
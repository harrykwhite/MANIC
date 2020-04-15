var speed_multiplier = 1;
var speed_final = 0;
var face_player = false;
target = obj_player;

if (instance_exists(target)){
	scr_enemy_find_companion();
	
	if (bite_to){
		var dirTo;
		move_x_to = target.x;
		move_y_to = target.y + 6;
		
		dirTo = point_direction(x, y, move_x_to, move_y_to);
		move_x_to += lengthdir_x(50, dirTo);
		move_y_to += lengthdir_y(50, dirTo);
		
		move_speed = 1.75;
		bite_to_time ++;
		bite_retreat_time = 0;
		
		if (distance_to_point(move_x_to, move_y_to) < 3) || (bite_to_time > 120){
			bite_to = false;
			bite_retreat = true;
			bite_retreat_direction = point_direction(x, y, move_x_to, move_y_to + 6) - 180;
			bite_retreat_x = target.x;
			bite_retreat_y = target.y + 6;
		}
	}else if (bite_retreat){
		move_x_to = x + lengthdir_x(30, bite_retreat_direction);
		move_y_to = y + lengthdir_y(30, bite_retreat_direction);
		
		move_speed = 1.6;
		bite_retreat_time ++;
		bite_to_time = 0;
		
		if (distance_to_point(move_x_to, move_y_to) < 16) || (distance_to_point(bite_retreat_x, bite_retreat_y) > 120) || (bite_retreat_time > 120){
			bite_to = false;
			bite_retreat = false;
			bite_retreat_time = 0;
		}
	}else{
		if (distance_to_point(target.x, target.y + 6) < 200){
			if (bark_time > 0){
				bark_time--;
			}else{
				scr_sound_play(snd_character_bark_0, false, 0.8, 1.2);
				bark_time = random_range(140, 260);
			}
		}
		
		if (distance_to_object(target) > 70){
			if (move_away_time > 0){
				move_away_time--;
				move_speed = 0;
			}else{
				move_speed = 1.2;
				move_x_to = target.x;
				move_y_to = target.y + 6;
			}
		}else{
			if (bite_time > 0){
				bite_time--;
			}else{
				bite_time = bite_time_max + random_range(-10, 10);
				bite_to = true;
				bite_retreat = false;
			}
			
			move_speed = 0;
			move_away_time = 20;
		}
	}
}else{
	move_speed = 0;
	face_player = false;
}

// Cutscene
if (cutscene_prop){
	if (!in_cutscene){
		speed_multiplier = 0;
	}
}

// Moving
speed_final = move_speed * speed_multiplier * move_speed_offset;

if (move_speed_real < speed_final){
    move_speed_real += min(0.2, speed_final - move_speed_real);
}else if (move_speed_real > speed_final){
    move_speed_real -= min(0.2, move_speed_real - speed_final);
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
if (speed_final > 0.1){
	sprite_index = spr_enemy_2_walk_0;
}else{
	sprite_index = spr_enemy_2_idle_0;
}

if (speed_final <= 0.1) || (!instance_exists(target)) || ((x == xprevious) && (y == yprevious)){
    image_speed = 0.05;
}else{
	image_speed = (speed_final * 0.165);
}
var speed_multiplier = 1;
var speed_final = 0;
var wait_negate = true, wait_stop_movement = false;
var face_player = false;
target = global.player;

if (instance_exists(target)){
	if (companion_attack_break > 240){
		var csize = array_length_1d(global.companion);
		for(var i = 0; i < csize; i++){
			if (instance_exists(global.companion[i])){
				var nearest = instance_nearest(x, y, global.companion[i]);
				if (distance_to_object(nearest) < 30){
					target = nearest;
					
					if (companion_attack_time < companion_attack_time_max){
						companion_attack_time++;
					}else{
						companion_attack_time = 0;
						companion_attack_break = 0;
					}
				}
			}
		}
	}else{
		companion_attack_break++;
	}
	
	if (bite_to){
		var dirTo;
		move_xTo = target.x;
		move_yTo = target.y + 6;
		
		dirTo = point_direction(x, y, move_xTo, move_yTo);
		move_xTo += lengthdir_x(30, dirTo);
		move_yTo += lengthdir_y(30, dirTo);
		
		move_speed = 1.85;
		if (distance_to_point(move_xTo, move_yTo) < 3){
			bite_to = false;
			bite_retreat = true;
			bite_retreat_direction = point_direction(x, y, move_xTo, move_yTo) - 180;
			bite_retreat_x = target.x;
			bite_retreat_y = target.y + 6;
		}
	}else if (bite_retreat){
		move_xTo = bite_retreat_x + lengthdir_x(80, bite_retreat_direction);
		move_yTo = bite_retreat_y + lengthdir_y(80, bite_retreat_direction);
		move_speed = 1.6;
		
		if (distance_to_point(move_xTo, move_yTo) < 24) || (distance_to_point(bite_retreat_x, bite_retreat_y) > 100){
			bite_to = false;
			bite_retreat = false;
		}
	}else{
		if (distance_to_point(target.x, target.y + 6) < 200){
			if (bark_time > 0){
				bark_time--;
			}else{
				scr_sound_play_distance(snd_character_bark_0, false, 300);
				bark_time = random_range(140, 260);
			}
		}
		
		if (distance_to_point(target.x, target.y + 6) > 50){
			if (move_away_time > 0){
				move_away_time--;
			}else{
				move_speed = 1.4;
				move_xTo = target.x;
				move_yTo = target.y + 6;
			}
		}else{
			move_speed = 0;
			move_away_time = 30;
			if (bite_time > 0){
				bite_time--;
			}else{
				bite_time = (60 * 0.5) + random_range(-20, 5);
				bite_to = true;
				bite_retreat = false;
			}
		}
	}
}else{
	move_speed = 0;
	face_player = false;
}

// Off - screen movement.
x = clamp(x, 22, room_width - 22);
y = clamp(y, 22, room_height - 22);

if (!onscreen(x, y)){
	speed_multiplier = 0;
}

// Barrel
var nbarrel = instance_nearest(x, y, obj_barrel_2);

if (instance_exists(nbarrel)) && (barrel_pause_break <= 0){
	if (distance_to_object(nbarrel) < 140){
		if (barrel_pause_time > 0){
			barrel_pause_time --;
			speed_multiplier = max(speed_multiplier - 0.5, 0);
		}else{
			barrel_pause_time = random(40);
			barrel_pause_break = random_range(60, 120);
		}
	}
}else{
	if (barrel_pause_break > 0){
		barrel_pause_break--;
	}
}

// Moving
speed_final = move_speed * speed_multiplier * move_speed_offset;

if (move_speed_real < speed_final){
    move_speed_real += 0.2;
}else if (move_speed_real > speed_final){
    move_speed_real -= 0.2;
}

mp_potential_step_object(move_xTo, move_yTo, move_speed_real, obj_p_solid);

// Facing
if (!face_player){
	if (move_xTo > x){
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

if (speed_final < 0.1) || (!instance_exists(target)) || ((x == xprevious) && (y == yprevious)){
    image_speed = 0.05;
}else if (speed_final >= 0.1) && (speed_final <= 0.75){
    image_speed = 0.15;
}else if (speed_final < 1.1) && (speed_final > 0.75){
    image_speed = 0.25;
}else if (speed_final >= 1.1){
    image_speed = 0.35;
}
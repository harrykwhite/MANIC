var speed_multiplier = 1;
var speed_final = 0;
var face_player = false;
target = obj_player;

if (instance_exists(target)){
	var dist_to = point_distance(x, y, target.x, target.y);
	
	if (companion_attack_break > 240){
		var csize = array_length_1d(global.companion);
		for(var i = 0; i < csize; i ++){
			if (instance_exists(global.companion[i])){
				var nearest = instance_nearest(x, y, global.companion[i]);
				if (distance_to_object(nearest) < 50){
					target = nearest;
					
					if (companion_attack_time < companion_attack_time_max){
						companion_attack_time ++;
					}else{
						companion_attack_time = 0;
						companion_attack_break = 0;
					}
					
					break;
				}
			}
		}
	}else{
		companion_attack_break ++;
	}
	
	move_x_to = target.x;
	move_y_to = target.y + 6;
	
	if (!mucus_is_releasing){
		if (mucus_release_time > 0){
			mucus_release_time --;
		}else{
			mucus_release_time = random_range(60 * 4, 60 * 8);
			mucus_is_releasing = true;
		}
	}else{
		speed_multiplier = 0;
	}
	
	if (dist_to > 10){
		move_speed = 0.2;
	}else{
		move_speed = 0;
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

mp_potential_step_object(move_x_to, move_y_to, move_speed_real, obj_p_solid);

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
if (!mucus_is_releasing){
	if (speed_final > 0.1){
		sprite_index = spr_enemy_4_idle_0;
		image_speed = 0.1;
	}else{
		sprite_index = spr_enemy_4_idle_0;
		image_speed = 0.1;
	}
}else{
	sprite_index = spr_enemy_4_attack_0;
	image_speed = 0.1;
}
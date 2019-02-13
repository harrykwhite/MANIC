var speed_multiplier = 1;
var speed_final = 0;
var wait_negate = true, wait_stop_movement = false;
var face_player = true;
target = global.player;

if (instance_exists(target)){
	leash_dir = keeper.move_dir;
	
	if (distance_to_object(target) < leash_length){
		leash_dir = point_direction(x, y, target.x, target.y + 6);
	}
	
	move_xTo = keeper.x + lengthdir_x(leash_length + leash_length_offset, leash_dir + leash_offset);
	move_yTo = keeper.y + lengthdir_y(leash_length + leash_length_offset, leash_dir + leash_offset);
	
	if (leash_bite){
		var dirToTarget = point_direction(x, y, target.x, target.y);
		speed_multiplier += 0.7;
		move_xTo = target.x + lengthdir_x(30, dirToTarget);
		move_yTo = target.y + lengthdir_y(30, dirToTarget);
		
		if (attack_active_time > 0){
			attack_active_time --;
		}else{
			leash_bite = false;
			leash_bite_retreat = true;
		}
	}else if (leash_bite_retreat){
		leash_length_offset = -20;
		speed_multiplier += 0.5;
	}else{
		if (attack_time > 0){
			attack_time --;
		}else{
			leash_bite = true;
			attack_active_time = 45;
			attack_time = random_range(50, 170);
		}
		
		leash_length_offset  = 0;
	}
	
	if (distance_to_point(move_xTo, move_yTo) > 5){
		move_speed = 1.8;
	}else{
		move_speed = 0;
		if (leash_bite){
			leash_bite = false;
			leash_bite_retreat = true;
		}
		
		if (leash_bite_retreat){
			leahs_bite = false;
			leash_bite_retreat = false;
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
speed_final = move_speed * speed_multiplier * move_speed_offset ;

if (move_speed_real < speed_final){
    move_speed_real += 0.2;
}else if (move_speed_real > speed_final){
    move_speed_real -= 0.2;
}

mp_potential_step_object(move_xTo, move_yTo, move_speed_real, obj_p_solid);

// Facing
if (face_player == false){
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
if (speed_final > 0.5){
	sprite_index = spr_thedogkeeper_dog_walk_0;
}else{
	sprite_index = spr_thedogkeeper_dog_idle_0;
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
var speed_multiplier = 1;
var speed_final = 0;
var face_player = false;
target = obj_player;

if (instance_exists(target)){
	if (wander){
		if (distance_to_point(wander_x_to, wander_y_to) < 10) || (wander_time <= 0){
			var dir = random(360);
			var len = random_range(80, 150);
			var trials = 0;
			
			wander_x_to = x + lengthdir_x(len, dir);
			wander_y_to = y + lengthdir_y(len, dir);
		
			while(collision_line(x, y, wander_x_to, wander_y_to, obj_p_solid, false, false) || (point_distance(wander_x_to, wander_y_to, 530, 550) < 300)){
				dir = random(360);
				len = random_range(80, 150);
		
				wander_x_to = x + lengthdir_x(len, dir);
				wander_y_to = y + lengthdir_y(len, dir);
				
				if (trials < 100){
					trials ++;
				}else{
					break;
				}
			}
		
			if (wander_stage < wander_stage_max){
				wander_stage ++;
				wander_time = 70;
			}else{
				wander = false;
				wander_time = 0;
				wander_stage = 0;
				wander_x_to = x;
				wander_y_to = y;
				wander_break = random_range(30, 60);
			}
		}
		
		if (wander_time > 0){
			wander_time --;
		}
		
		move_speed = 1.3;
		move_x_to = wander_x_to;
		move_y_to = wander_y_to;
	}else{
		move_speed = 0;
		move_x_to = x;
		move_y_to = y;
		
		if (wander_break > 0){
			wander_break --;
		}else{
			wander = true;
			wander_stage_max = choose(3, 4);
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

move_x_to = clamp(move_x_to, 0, room_width);
move_y_to = clamp(move_y_to, 0, room_height);

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
	sprite_index = spr_enemy_5_walk_0;
}else{
	sprite_index = spr_enemy_5_idle_0;
}

if (speed_final <= 0.1) || (!instance_exists(target)) || ((x == xprevious) && (y == yprevious)){
    image_speed = 0.05;
}else{
	image_speed = (speed_final * 0.165);
}
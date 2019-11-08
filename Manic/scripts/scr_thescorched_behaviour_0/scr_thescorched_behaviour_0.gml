var speed_multiplier = 1.1;
var speed_final = 0;
var face_player = false;
target = obj_player;

if (instance_exists(target)){
	if (state == 0){
		move_speed = 2.5;
		
		if (distance_to_point(run_x, run_y) > 20){
			move_x_to = run_x;
			move_y_to = run_y;
		}else{
			if (run_count < 5){
				run_count ++;
				
				run_x = random_range(arena_x, arena_x + arena_width);
				run_y = random_range(arena_y, arena_y + arena_height);
				
				while(distance_to_point(run_x, run_y) < 80){
					run_x = random_range(arena_x, arena_x + arena_width);
					run_y = random_range(arena_y, arena_y + arena_height);
				}
			}else{
				if (!cutscene_prop){
					state = 1;
				}
				
				run_count = 0;
			}
		}
	}else if (state == 1){
		move_speed = 0;
		
		if (release_count < 7){
			if (release_time > 0){
				release_time--;
			}else{
				var interval = 360 / 6;
				scr_sound_play_distance_pitch(snd_weapon_flare_1, false, 400, 0.8, 1.2);
				flash_time = 5;
				
				for(var i = 0; i < 360; i += interval){
					fire = instance_create(x, y, obj_proj_4);
					fire.spd = 3;
					fire.dir = i + release_offset;
					fire.damage = 1;
					fire.strength = 1;
					fire.enemy = true;
				}
				
				if (health_current < health_max - 15){
					if (release_offset == 0){
						release_offset = interval / 2;
					}else{
						release_offset = 0;
					}
				}
				
				release_time = 35;
				release_count ++;
			}
		}else{
			release_time = 45;
			release_count = 0;
			
			state = 0;
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

if (move_x_to > x){
	image_xscale = scale;
}else{
	image_xscale = -scale;
}

// Animation
if (speed_final > 0.1){
	sprite_index = spr_thescorched_walk_1;
}else{
	sprite_index = spr_thescorched_idle_1;
}

if (speed_final <= 0.1) || (!instance_exists(target)) || ((x == xprevious) && (y == yprevious)){
    image_speed = 0.05;
}else{
	image_speed = (speed_final * 0.165);
}
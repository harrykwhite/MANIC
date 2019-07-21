var speed_multiplier = 0.8;
var speed_final = 0;
var face_player = false;
target = obj_player;

if (instance_exists(target)){
	if (state == 0){
		move_speed = min(2 / ((health_current / health_max) * 2), 2.75);
		
		if (instance_exists(weapon) && weapon != -1){
			weapon.dir = point_direction(x, y, move_x_to, move_y_to);
			
			if (shoot_time > 0){
				shoot_time --;
				shoot_active = true;
			}else{
				shoot_active = false;
			}
			
			if (shoot_active){
				if (shoot_delay > 0){
					shoot_delay --;
					weapon.attack = false;
				}else{
					weapon.attack = true;
				}
			}else{
				weapon.attack = false;
			}
		}
		
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
				
				shoot_delay = 40;
				shoot_time = 80 + random_range(-10, 8) * ((health_current / health_max) * 2);
			}else{
				state = 1;
				run_count = 0;
			}
		}
	}else if (state == 1){
		move_speed = 0;
		
		if (instance_exists(weapon) && weapon != -1){
			weapon.dir = point_direction(x, y, target.x, target.y);
			weapon.attack = false;
			face_player = true;
		}
		
		if (release_count < 4){
			if (release_time > 0){
				release_time --;
			}else{
				var interval = 360 / 7;
				scr_sound_play_distance_pitch(snd_weapon_flare_1, false, 300, 0.8, 1.2);
				flash_time = 5;
				
				for(var i = 0; i < 360; i += interval){
					fire = instance_create(x, y, obj_proj_4);
					fire.spd = clamp(4 / ((health_current / health_max) * 4), 4, 5);
					fire.dir = i + release_offset;
					fire.damage = 1;
					fire.strength = 1;
					fire.enemy = true;
				}
				
				if (release_offset == 0){
					release_offset = interval / 2;
				}else{
					release_offset = 0;
				}
				
				release_time = max(45 * ((health_current / health_max) * 2), 35);
				release_count ++;
			}
		}else{
			release_time = max(45 * ((health_current / health_max) * 2), 35);
			release_count = 0;
			
			state = 2;
		}
	}else if (state == 2){
		var maxtime = max(60 * 2.25 * ((health_current / health_max) * 2), 60 * 1.75);
		
		if (slowfire_time < maxtime){
			face_player = true;
			
			if (slowfire_time > 70) && (slowfire_time < maxtime - 30){
				weapon.attack = true;
			}
			
			weapon.dir = point_direction(x, y, obj_player.x, obj_player.y);
			
			slowfire_time ++;
			
			if (distance_to_point(move_x_to, move_y_to) > 10){
				move_speed = clamp(1 / ((health_current / health_max) * 4), 1, 2);
			}else{
				move_x_to = x + random_range(-40, 40);
				move_y_to = y + random_range(-40, 40);
				
				while(distance_to_point(move_x_to, move_y_to) < 10){
					move_x_to = x + random_range(-40, 40);
					move_y_to = y + random_range(-40, 40);
				}
			}
		}else{
			slowfire_time = 0;
			state = 0;
		}
	}
}else{
	if (image_xscale == scale){
		weapon.dir = 360;
	}else{
		weapon.dir = 180;
	}
	
	weapon.attack = false;
	
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

scr_pawn_find_path();

// Animation
if (instance_exists(weapon) && weapon != -1){
	scr_pawn_human_facing();
	
	var Idle0, Walk0;
	var Idle1, Walk1;
	var Idle2, Walk2;
	
	Idle0 = spr_thescorched_idle_0; Walk0 = spr_thescorched_walk_0;
	Idle1 = spr_thescorched_idle_1; Walk1 = spr_thescorched_walk_1;
	Idle2 = spr_thescorched_idle_2; Walk2 = spr_thescorched_walk_2;
	
	if (speed_final <= 0.1){
		scr_pawn_sprite_weapon(global.pawnweapon_playerindex[weapon_index], Idle1, Idle0, Idle2);
	}else{
		scr_pawn_sprite_weapon(global.pawnweapon_playerindex[weapon_index], Walk1, Walk0, Walk2);
	}
}

if (speed_final <= 0.1) || (!instance_exists(target)) || ((x == xprevious) && (y == yprevious)){
    image_speed = 0.05;
}else{
	image_speed = (speed_final * 0.165);
}
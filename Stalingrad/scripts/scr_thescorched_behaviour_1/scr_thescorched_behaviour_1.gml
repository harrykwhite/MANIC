var speed_multiplier = 0.8;
var speed_final = 0;
var wait_negate = true, wait_stop_movement = false;
var face_player = false;
target = obj_player;

if (instance_exists(target)){
	var mindist = 27;
	
	if (state == 0){
		move_speed = 2;
		
		if (instance_exists(weapon)){
			weapon.dir = point_direction(x, y, move_xTo, move_yTo);
			
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
			move_xTo = run_x;
			move_yTo = run_y;
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
				shoot_time = 80 + random_range(-10, 8);
			}else{
				state = 1;
				run_count = 0;
			}
		}
	}else if (state == 1){
		move_speed = 0;
		
		if (instance_exists(weapon)){
			weapon.dir = point_direction(x, y, target.x, target.y);
			weapon.attack = false;
			face_player = true;
		}
		
		if (release_count < 5){
			if (release_time > 0){
				release_time--;
			}else{
				var interval = 360 / 8;
				scr_sound_play_distance_pitch(snd_weapon_flare_1, false, 300, 0.8, 1.2);
				flash_time = 5;
				
				for(var i = 0; i < 360; i += interval){
					fire = instance_create(x, y, obj_proj_4);
					fire.spd = 4;
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
				
				release_time = 45;
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
if (instance_exists(weapon)){
	var Idle0, Walk0;
	var Idle1, Walk1;
	var Idle2, Walk2;
	
	Idle0 = spr_thescorched_idle_0; Walk0 = spr_thescorched_walk_0;
	Idle1 = spr_thescorched_idle_1; Walk1 = spr_thescorched_walk_1;
	Idle2 = spr_thescorched_idle_2; Walk2 = spr_thescorched_walk_2;
	
	if (speed_final < 0.1){
		scr_pawn_sprite_weapon(global.pawnweapon_realindex[weapon_index], Idle1, Idle0, Idle2);
	}else{
		scr_pawn_sprite_weapon(global.pawnweapon_realindex[weapon_index], Walk1, Walk0, Walk2);
	}
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
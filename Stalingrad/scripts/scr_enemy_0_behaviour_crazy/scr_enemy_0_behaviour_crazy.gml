var speed_multiplier = 1;
var speed_final = 0;
target = global.player;

if (instance_exists(target)) && (instance_exists(weapon)){
	if (companion_attack_break < 240){
		var csize = array_length_1d(global.companion);
		for(var i = 0; i < csize; i++){
			if (instance_exists(global.companion[i])){
				var nearest = instance_nearest(x, y, global.companion[i]);
				if (distance_to_object(nearest) < 38){
					target = nearest;
					move_xTo = target.x;
					move_yTo = target.y + 6;
					crazy_attackbreak = 34;
					
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
	
	if (crazy_runback){
		var xx = crazy_runx + lengthdir_x(160, crazy_attackdir - 180);
		var yy = crazy_runy + lengthdir_y(160, crazy_attackdir - 180);
		
		if (crazy_runback_time < 42){
			crazy_runback_time ++;
		}else{
			crazy_runback = false;
			crazy_runback_time = 0;
		}
		
		if (distance_to_point(xx, yy) > 15){
			move_speed = 2;
			crazy_dash = false;
			
			move_xTo = xx;
			move_yTo = yy;
		}else{
			crazy_runback = false;
		}
		
		weapon.dir = point_direction(x, y, xx, yy);
	}else{
		if (point_distance(x, y, target.x, target.y) < 46){
			move_speed = 0;
			if (crazy_attackbreak > 0){
				crazy_attackbreak --;
			}else{
				weapon.attack = true;
				crazy_runback = true;
				crazy_attackdir = weapon.dir;
				crazy_runx = x;
				crazy_runy = y;
				crazy_dash = false;
				crazy_attackbreak = 34;
			}
		}else{
			move_speed = 1.175;
			move_xTo = target.x;
			move_yTo = target.y;
			crazy_attackbreak = 34;
		}
		
		if (point_distance(x, y, target.x, target.y) > 75){
			if (crazy_dashbreak < 45){
				crazy_dashbreak ++;
			}else{
				crazy_dash = true;
				crazy_dashdirection = point_direction(x, y, move_xTo, move_yTo) + random_range(-5, 5);
				crazy_dashspeed = 5.2;
				crazy_dashtime = 6;
				crazy_dashbreak = 0;
			}
		}
		
		weapon.dir = point_direction(x, y, target.x, target.y + 1);
	}
}else{
	if (image_xscale == scale){
		if (instance_exists(weapon)){
			weapon.dir = 360;
			weapon.angle_offset = 90;
		}
	}else{
		if (instance_exists(weapon)){
			weapon.dir = 180;
			weapon.angle_offset = -90;
		}
	}
	
	if (move_speed > 0){
		move_speed -= 0.1;
	}else{
		move_speed = 0;
	}
	
	crazy_dash = false;
}

// Offscreen movement
if (!crazy_cutscene_prop){
	x = clamp(x, 22, room_width - 22);
	y = clamp(y, 22, room_height - 22);

	if (!onscreen(x, y + 12)){
		speed_multiplier = 0;
	}
}

// Dash
if (crazy_dash){
	image_speed = 0;
	
	if (crazy_dashtime > 0){
		crazy_dashtime --;
	}else{
		crazy_dash = false;
	}

	var trail = scr_effect_trail(sprite_index, 0.8, 0.075, 0, image_xscale, 1, 0.01, 0.5, (crazy_dashdirection - 180) + random_range(-30, 30));
	if (health_current <= floor(health_max / 3)) || (bleed){
		trail.special = "LowHealth";
	}
	
	part_particles_create(global.ps_front, x + random_range(-6, 6), y + random_range(-12, 12), global.pt_smoke_1, 2);
}

// Cutscene
if (crazy_cutscene_prop){
	if (!crazy_in_cutscene){
		speed_multiplier = 0;
		crazy_dash = false;
	}
}

// Moving
speed_final = move_speed * speed_multiplier * move_speed_offset;

if (move_speed_real < speed_final){
    move_speed_real += 0.2;
}else if (move_speed_real > speed_final){
    move_speed_real -= 0.2;
}

if (crazy_dash){
	if (!place_meeting(x + lengthdir_x(crazy_dashspeed + 1, crazy_dashdirection), y + lengthdir_y(crazy_dashspeed + 1, crazy_dashdirection), obj_p_solid)){
		x += lengthdir_x(crazy_dashspeed, crazy_dashdirection);
		y += lengthdir_y(crazy_dashspeed, crazy_dashdirection);
	}else{
		crazy_dash = false;
	}
}else{
	mp_potential_step_object(move_xTo, move_yTo, move_speed_real, obj_p_solid);
}

// Facing
if (crazy_runback){
	if (move_xTo > x){
		image_xscale = scale;
	}else{
		image_xscale = -scale;
	}
}else{
	if (instance_exists(target)){
		if (target.x > x){
			image_xscale = scale;
		}else{
			image_xscale = -scale;
		}
	}
}

// Animation
if (instance_exists(weapon)){
	var Idle0 = spr_enemy_0_brain_idle_0, Walk0 = spr_enemy_0_brain_walk_0;
	var Idle1 = spr_enemy_0_brain_idle_1, Walk1 = spr_enemy_0_brain_walk_1;
	var Idle2 = spr_enemy_0_brain_idle_2, Walk2 = spr_enemy_0_brain_walk_2;
	
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
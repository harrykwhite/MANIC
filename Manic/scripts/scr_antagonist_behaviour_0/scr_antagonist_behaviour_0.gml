var speed_multiplier = 1;
var speed_final = 0;
var face_player = true;
var weapon_exists = weapon != -1;
target = obj_player;

if (instance_exists(target)){
	var dir_to_target = point_direction(x, y, target.x, target.y);
	var nearest_bullet = instance_nearest(x, y, obj_proj_0);
	var phasetwo = health_current < health_max / 3;
	
	if (weapon_exists){
		weapon_exists = instance_exists(weapon);
	}
	
	if (state == 0){
		var dist = distance_to_point(run_x, run_y);
		var dir = point_direction(x, y, run_x, run_y);
		move_speed = 2 + (0.75 * phasetwo);
		state_time_max = 60 * 10;
		
		/*if (dist < 50){
			move_speed += 1 - (dist / 50);
		}*/
		
		if (weapon_exists){
			weapon.dir = dir_to_target;
			if (distance_to_object(target) < 27){
				if (attack_time > 0){
					attack_time --;
				}else{
					weapon.attack = true;
					attack_time = 40;
				}
			}
		}
		
		if (!dash){
			if (run_time > 0) && (dist > 15){
				move_x_to = run_x;
				move_y_to = run_y;
				run_time --;
				
				if (dash_time > 0){
					dash_time -= 1 + phasetwo;
				}else{
					dash = true;
					dash_direction = dir;
					dash_time = 7;
				}
			}else{
				var dir = random(360);
				var len = random_range(95, 130);
				run_x = target.x + lengthdir_x(len, dir);
				run_y = target.y + lengthdir_y(len, dir);
				run_time = 40;
			}
		}
	}else if (state == 1){
		var nearest_barrel_from_target = instance_nearest(target.x, target.y, obj_barrel_2);
		move_speed = 2.5 + (0.75 * phasetwo);
		state_time_max = 60 * 7;
		
		if (run_away_time < 60){
			if (run_away_time == 0){
				run_away_direction = dir_to_target - 180;
			}
			
			if (distance_to_object(target) > 120){
				run_away_time ++;
				run_away_direction = 0;
				
				move_speed = 0;
				face_player = true;
				weapon.dir = point_direction(x, y, target.x, target.y);
			}else{
				if (!dash){
					if (dash_time > 0){
						dash_time --;
					}else{
						dash = true;
						dash_direction = run_away_direction;
						dash_time = 7;
					}
				}
				
				move_x_to = x + lengthdir_x(100, run_away_direction);
				move_y_to = y + lengthdir_y(100, run_away_direction);
			}
			
			if (weapon_exists){
				face_player = false;
				weapon.dir = point_direction(x, y, move_x_to, move_y_to);
			}
		}else{
			move_speed = 0;
			move_x_to = target.x;
			move_y_to = target.y;
			
			if (weapon_exists){
				weapon.dir = point_direction(x, y, move_x_to, move_y_to);
				weapon.attack = true;
				
				if (nearest_barrel_from_target != noone){
					if (point_distance(target.x, target.y, nearest_barrel_from_target.x, nearest_barrel_from_target.y) < 70){
						weapon.dir = point_direction(x, y, nearest_barrel_from_target.x, nearest_barrel_from_target.y + 4);
					}
				}
			}
		}
	}else if (state == 2){
		var isranged = global.weapon_type[global.pawnweapon_playerindex[weapon_index]] == WeaponType.Ranged;
		state_time_max = 60 * 1.85;
		move_speed = 0;
		
		if (weapon_exists){
			weapon.dir = dir_to_target;
			
			if (throw_weapon_time < throw_weapon_time_max){
				throw_weapon_time ++;
			}else{
				var drop = instance_create(x, y, obj_weapondrop);
				drop.index = global.pawnweapon_playerindex[weapon_index];
				drop.spd = 10;
				drop.angle = weapon.dir;
				drop.dir = dir_to_target + random_range(-3, 3);
				drop.enemy = true;
				drop.damage = 2;
				
				if (drop.index == PlayerWeapon.Revolver){
					drop.ammo = random(4);
				}
				
				scr_effect_screenshake(1);
				scr_sound_play(snd_weapon_swing_0, false, 0.9, 1.1);
				
				instance_destroy(weapon);
				weapon = -1;
			}
		}
	}else if (state == 3){
		var dist = distance_to_point(run_x, run_y);
		var dir = point_direction(x, y, run_x, run_y);
		var isranged = global.weapon_type[global.pawnweapon_playerindex[weapon_index]] == WeaponType.Ranged;
		move_speed = 3;
		state_time_max = 60 * 8;
		
		if (weapon_exists){
			weapon.dir = dir_to_target;
			
			if (isranged){
				weapon.attack = true;
			}else{
				if (distance_to_object(target) < 27){
					if (attack_time > 0){
						attack_time --;
					}else{
						weapon.attack = true;
					}
				}
			}
		}
		
		if (weapon_change_time < weapon_change_time_max){
			weapon_change_time ++;
		}else{
			if (isranged){
				weapon_index = weapon_change_origin;
			}else{
				weapon_index = PawnWeapon.Revolver;
			}
			
			if (weapon_exists){
				instance_destroy(weapon);
			}
			
			weapon = instance_create(x, y, global.pawnweapon_object[weapon_index]);
	        weapon.owner = id;
			weapon_change_time = 0;
		}
		
		if (!dash){
			if (run_time > 0) && (dist > 15){
				move_x_to = run_x;
				move_y_to = run_y;
				run_time --;
				
				if (dash_time > 0){
					dash_time -= 1 + phasetwo;
				}else{
					dash = true;
					dash_direction = dir;
					dash_time = 7;
				}
			}else{
				var dir = random(360);
				var len = random_range(70, 110);
				
				if (isranged){
					len += 80;
				}
				
				run_x = target.x + lengthdir_x(len, dir);
				run_y = target.y + lengthdir_y(len, dir);
				run_time = random_range(40, 50);
			}
		}
	}
	
	if (!dash) && (dash_time <= 0){
		if (nearest_bullet != noone){
			if (distance_to_object(nearest_bullet) < 30){
				if (random(5) < 1){
					dash = true;
					dash_direction = point_direction(x, y, nearest_bullet.x, nearest_bullet.y) + 90;
					dash_time = 7;
				}
			}
		}
	}
	
	if (state_time < state_time_max){
		state_time ++;
	}else{
		var maxstate = 2;
		
		if (phasetwo){
			maxstate = 3;
		}
		
		if (state < maxstate){
			state ++;
		}else{
			state = 0;
		}
		
		switch(state){
			case 0:
				if (maxstate == 3){
					weapon_index = weapon_change_origin;
				}else{
					weapon_index = choose(PawnWeapon.Katana, PawnWeapon.Axe, PawnWeapon.Sledgehammer);
				}
				break;
			
			case 1:
				weapon_index = PawnWeapon.Revolver;
				break;
			
			case 3:
				weapon_index = choose(PawnWeapon.Katana, PawnWeapon.Axe, PawnWeapon.Sledgehammer);
				break;
		}
		
		if (weapon_exists){
			instance_destroy(weapon);
		}
		
		weapon = instance_create(x, y, global.pawnweapon_object[weapon_index]);
        weapon.owner = id;
		
		run_away_time = 0;
		run_away_direction = 0;
		
		throw_weapon_time = 0;
		
		weapon_change_time = 0;
		weapon_change_origin = weapon_index;
		
		state_time = 0;
	}
}else{
	if (weapon_exists) && (instance_exists(weapon)){
		if (image_xscale == scale){
			weapon.dir = 360;
		}else{
			weapon.dir = 180;
		}
	}
	
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

if (dash){
	image_speed = 0;

	var trail = scr_effect_trail(sprite_index, 0.8, 0.075, 0, image_xscale, 1, 0.01, 0.5, (dash_direction - 180) + random_range(-30, 30));
	if (health_current <= floor(health_max / 3)) || (bleed){
		trail.special = "LowHealth";
	}
	part_particles_create(global.ps_front, x + random_range(-6, 6), y + random_range(-12, 12), global.pt_smoke_1, 2);
	
	if (!place_meeting(x + lengthdir_x(dash_speed + 1, dash_direction), y + lengthdir_y(dash_speed + 1, dash_direction), obj_p_solid) && (dash_time > 0)){
		x += lengthdir_x(dash_speed, dash_direction);
		y += lengthdir_y(dash_speed, dash_direction);
		dash_time --;
	}else{
		dash = false;
		dash_time = random_range(80, 120);
	}
}else{
	mp_potential_step_object(move_x_to, move_y_to, move_speed_real, obj_p_solid);
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
if (instance_exists(weapon)){
	var Idle0, Walk0;
	var Idle1, Walk1;
	var Idle2, Walk2;
	
	Idle0 = spr_antagonist_idle_0; Walk0 = spr_antagonist_walk_0;
	Idle1 = spr_antagonist_idle_1; Walk1 = spr_antagonist_walk_1;
	Idle2 = spr_antagonist_idle_2; Walk2 = spr_antagonist_walk_2;
	
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
var speed_multiplier = 1;
var speed_final = 0;
var wait_negate = true, wait_stop_movement = false;
var face_target = false;
target = global.player;

switch(type){
	case EnemyOneType.Fast:
		speed_multiplier += 0.2;
		break;
	
	case EnemyOneType.Large:
		speed_multiplier -= 0.3;
		break;
	
	case EnemyOneType.Grenadier:
		speed_multiplier -= 0.15;
		break;
	
	case EnemyOneType.Sniper:
		speed_multiplier -= 0.2;
		break;
	
	case EnemyOneType.Healer:
		speed_multiplier -= 0.2;
		break;
	
	case EnemyOneType.Mother:
		speed_multiplier -= 0.075;
		if (health_current <= health_max / 1.5){
			speed_multiplier += 0.35;
		}
		
		if (health_current <= health_max / 2.25){
			speed_multiplier += 0.35;
		}
		break;
	
	case EnemyOneType.Fly:
		speed_multiplier -= 0.4;
		break;
}

if (instance_exists(target)){
	var mindist = 27;
	var weapon_exists = instance_exists(weapon) && weapon != -1;
	
	if (sporadic){
		if (sporadic_time < sporadic_timemax){
			sporadic_time ++;
		}else{
			var dir_to = point_direction(x, y, target.x, target.y + 6);
			move_xTo = x + lengthdir_x(200, dir_to + random_range(-20, 20));
			move_yTo = y + lengthdir_y(200, dir_to + random_range(-20, 20));
			sporadic_time = 0;
			face_target = true;
		}
	}else{
		move_xTo = target.x;
		move_yTo = target.y + 6;
	}
	
	if (type == EnemyOneType.Healer) && (healer_instance != noone) && (instance_exists(healer_instance)){
		if (distance_to_object(healer_instance) < 7){
			healer_instance.move_speed = 0;
			if (healer_healtime > 0){
				healer_healtime --;
			}else{
				healer_instance.whiteflash_alpha = 0.7;
				healer_instance.health_scale = 1.5;
				healer_instance.health_current += 2;
				scr_sound_play_distance(snd_object_health_pickup_0, false, 180);
		
				repeat(5){
					part_particles_create(global.ps_bottom, healer_instance.x + random_range(-4, 4), healer_instance.y + random_range(-4, 4), global.pt_wood_1, 1);
				}
		
				part_type_direction(global.pt_heal_0, 0, 360, 0, 0);
		
				repeat(14){
					part_particles_create(global.ps_front, healer_instance.x + random_range(-6, 6), healer_instance.y + random_range(-13, 13), global.pt_heal_0, 1);
				}
				
				healer_instance = noone;
				healer_healtime = 5;
				healer_findtime = 70;
				exit;
			}
		}else{
			move_speed = 2.65;
			move_xTo = healer_instance.x;
			move_yTo = healer_instance.y;
			
			if (weapon_exists){
				weapon.dir = point_direction(x, y, healer_instance.x, healer_instance.y);
			}
		}
	}else{
		if (weapon_exists){
			if (weapon.type != WeaponType.Melee){
				mindist = 115;
				
				if ((cutscene_prop) && (in_cutscene)){
					mindist = 30;
				}
			}else{
				speed_multiplier += 0.2;
			}
		}
	
		if (global.player_healthCurrent < 4){
			speed_multiplier -= 0.2;
		}
		
		if (companion_attack_break > 240){
			var csize = array_length_1d(global.companion);
			for(var i = 0; i < csize; i++){
				if (instance_exists(global.companion[i])){
					var nearest = instance_nearest(x, y, global.companion[i]);
					if (distance_to_object(nearest) < 38){
						target = nearest;
						move_xTo = target.x;
						move_yTo = target.y + 6;
						
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
	
		if (type == EnemyOneType.Grenadier){
			var inst = instance_nearest(x, y, obj_throwobject_1);
		
			if (instance_exists(inst)) && (inst != noone){
				var dir = point_direction(inst.x, inst.y, x, y);
			
				if (distance_to_object(inst) < 33){
				
					wait = 60;
					move_xTo = x + lengthdir_x(20, dir);
					move_yTo = y + lengthdir_y(20, dir);
				
					wait_stop_movement = false;
					wait_negate = false;
				
				}else{
					wait_stop_movement = true;
					wait_negate = true;
				}
			}
		}
		
		if (distance_to_point(move_xTo, move_yTo) > mindist){
			move_speed = 1;
		}else{
			move_speed = 0;
		}
	
		if (weapon_exists){
			weapon.dir = point_direction(x, y, target.x, target.y + 6);
			
			if (type == EnemyOneType.Sniper){
				if (weapon.attack_time < weapon.attack_time_max / 3){
					speed_multiplier = 0;
				}
			}
			
			if (!collision_line(x, y, move_xTo, move_yTo, obj_p_solid, false, true)) && (global.cutscene_current == -1){
				if (distance_to_point(target.x, target.y + 6) < mindist + 10) && (livetime > 80){
					if (type != EnemyOneType.Sniper){
						if (attack_time > 0){
							attack_time--;
						}else{
							var time = 45;
				
							if (type == EnemyOneType.Large){
								time = 32;
							}
				
							if (global.player_healthCurrent < 3){
								time *= 2;
							}
				
							if (type == EnemyOneType.Grenadier){
								if (weapon.index != PawnWeapon.Grenade){
									instance_destroy(weapon);
									weapon = instance_create(x, y, obj_pawnweapon_4);
									weapon.owner = id;
									weapon_index = PawnWeapon.Grenade;
									time = 120;
									attack_time = time * attack_time_offset;
									exit;
								}else{
									time = 100;
									if (collision_line(x, y, target.x, target.y, obj_p_solid, false, true)) || (collision_line(x, y, target.x, target.y, obj_enemy_0, false, true)){
										exit;
									}
								}
							}
						
							weapon.dir = point_direction(x, y, target.x, target.y);
							weapon.attack = true;
							attack_time = time * attack_time_offset;
						}
					}
				}
			}
		}
		
		if (type == EnemyOneType.Healer){
			if (health_current < health_max){
				speed_multiplier = 0;
				if (healer_healselftime > 0){
					healer_healselftime --;
				}else{
					whiteflash_alpha = 0.7;
					health_scale = 1.5;
					health_current = clamp(health_current + 2, 0, health_max);
					healer_healselftime = 45;
					scr_sound_play_distance(snd_object_health_pickup_0, false, 180);
					
					repeat(5){
						part_particles_create(global.ps_bottom, x + random_range(-4, 4), y + random_range(-4, 4), global.pt_wood_1, 1);
					}
				}
		
				part_type_direction(global.pt_heal_0, 0, 360, 0, 0);		 
			}
		}
	
		if (wait_stop_movement ){
			if (wait > 0){
				speed_multiplier = 0;
			}
		}
	}
}else{
	move_speed = 0;
	face_target = false;
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

// Cutscene
if (cutscene_prop){
	if (!in_cutscene){
		speed_multiplier = 0;
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
if (!face_target){
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
	
	switch(type){
		
		case EnemyOneType.Grenadier:
			Idle0 = spr_enemy_0_light_idle_0; Walk0 = spr_enemy_0_light_walk_0;
			Idle1 = spr_enemy_0_light_idle_1; Walk1 = spr_enemy_0_light_walk_1;
			Idle2 = spr_enemy_0_light_idle_2; Walk2 = spr_enemy_0_light_walk_2;
			break;
			
		case EnemyOneType.Sniper:
			Idle0 = spr_enemy_0_light_idle_0; Walk0 = spr_enemy_0_light_walk_0;
			Idle1 = spr_enemy_0_light_idle_1; Walk1 = spr_enemy_0_light_walk_1;
			Idle2 = spr_enemy_0_light_idle_2; Walk2 = spr_enemy_0_light_walk_2;
			break;
		
		case EnemyOneType.Fly:
			Idle0 = spr_enemy_0_fly_idle_0; Walk0 = spr_enemy_0_fly_walk_0;
			Idle1 = spr_enemy_0_fly_idle_1; Walk1 = spr_enemy_0_fly_walk_1;
			Idle2 = spr_enemy_0_fly_idle_2; Walk2 = spr_enemy_0_fly_walk_2;
			break;
			
		case EnemyOneType.Healer:
			Idle0 = spr_enemy_0_healer_idle_0; Walk0 = spr_enemy_0_healer_walk_0;
			Idle1 = spr_enemy_0_healer_idle_1; Walk1 = spr_enemy_0_healer_walk_1;
			Idle2 = spr_enemy_0_healer_idle_2; Walk2 = spr_enemy_0_healer_walk_2;
			break;
			
		default:
			Idle0 = spr_enemy_0_idle_0; Walk0 = spr_enemy_0_walk_0;
			Idle1 = spr_enemy_0_idle_1; Walk1 = spr_enemy_0_walk_1;
			Idle2 = spr_enemy_0_idle_2; Walk2 = spr_enemy_0_walk_2;
			break;
	}
	
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
var speed_multiplier = 1;
var face_player = false;

if (instance_exists(obj_player)){
	var weapon_does_exist = false;
	
	if (weapon != -1){
		weapon_does_exist = instance_exists(weapon);
	}
	
	if (!in_cutscene){
		if (!instance_exists(target)){
			runaway_starttime = 0;
			runaway_time = 0;
			
			if (global.cutscene_current == -1) && (distance_to_object(obj_player) < 150){
				var enemyCount = array_length_1d(global.enemy);
				for(var i = 0; i < enemyCount; i ++){
					if (i == 1){
						continue;
					}
					
					if (instance_exists(global.enemy[i])){
						target = instance_nearest(x, y, global.enemy[i]);
						
						if (target.object_index == obj_antagonist){
							if (target.walk_off) || (target.near_dead){
								target = noone;
								continue;
							}
						}
						
						if (target.object_index == obj_thedogkeeper){
							if (!target.dogs_downed){
								var dog = instance_nearest(x, y, obj_thedogkeeper_dog);
								
								if (dog != noone){
									target = dog;
									break;
								}
							}
						}
						
						if (target.cutscene_prop) || (collision_line(x, y, target.x, target.y, obj_p_solid, false, true)) || (distance_to_object(target) > 500){
							target = noone;
							continue;
						}
					}
				}
			}
			
			while(weapon_index == PawnWeapon.Knife){
				instance_destroy(weapon);
				weapon = instance_create(x, y, global.pawnweapon_object[PawnWeapon.Grenade]);
			    weapon.owner = id;
			    weapon_index = PawnWeapon.Grenade;
			}
		
			var dist_to_player = distance_to_object(obj_player);
			
			if (dist_to_player > 70 + (60 * order)) || (global.cutscene_current == 52){
				move_x_to = obj_player.x;
				move_y_to = obj_player.y;
				move_speed = 1.8;
				
				if (dist_to_player > 100 + (60 * order)){
					move_speed = 2.1;
				}
				
				if (dist_to_player > 140 + (60 * order)){
					move_speed = 2.7;
				}
				
				if (dist_to_player > 180 + (60 * order)){
					move_speed = 3.4;
				}
				
				face_player = true;
			}else if (global.cutscene_current == -1){
				if (distance_to_point(move_x_to, move_y_to) > 20){
					move_speed = 1.3;
				}else{
					move_speed = 0;
					if (move_time > 0){
						move_time--;
					}else{
						var attempts = 0;
						var dirto = point_direction(obj_player.x, obj_player.y, x, y);
						var xx = obj_player.x + lengthdir_x(70 * order, dirto);
						var yy = obj_player.y + lengthdir_y(70 * order, dirto);
						
						var dir = random(360);
						var len = random_range(20, 65);
						move_x_to = xx + lengthdir_x(len, dir);
						move_y_to = yy + lengthdir_y(len, dir);
						
						while(distance_to_point(move_x_to, move_y_to) < 15) || (collision_line(x, y, move_x_to, move_y_to, obj_p_solid, false, true)){
							dir = random(360);
							len = random_range(20, 65);
							move_x_to = xx + lengthdir_x(len, dir);
							move_y_to = yy + lengthdir_y(len, dir);
							
							if (attempts < 200){
								attempts ++;
							}else{
								break;
							}
						}
						
						move_time = random_range(30, 60) * 7;
					}
				}
			}else{
				move_speed = 0;
				move_x_to = obj_player.x;
				move_y_to = obj_player.y;
				face_player = true;
			}
		}else if (global.cutscene_current == -1){
			if (distance_to_object(obj_player) > 200){
				target = noone;
				runaway_time = 0;
				runaway_starttime = 0;
				return;
			}
			
			if (runaway_time > 0){
				runaway_time--;
		
				var dir = point_direction(target.x, target.y, x, y);
				move_x_to = target.x + lengthdir_x(500, dir);
				move_y_to = target.y + lengthdir_y(500, dir);
				move_speed = 1.5;
			}else{
				move_x_to = target.x;
				move_y_to = target.y;
				
				if (distance_to_object(target) > 80){
					move_speed = 1.3;
				}else{
					move_speed = 0;
					move_x_to = target.x;
					move_y_to = target.y;
					
					if (weapon_does_exist){
						if (attack_time > 0){
							attack_time --;
						}else{
							if (!collision_line(x, y, target.x, target.y, obj_p_solid, false, true)){
								if (weapon.attack_time <= 0) && (target.target == id){
									runaway_starttime = 2;
								}
							
								if (weapon_index == PawnWeapon.Knife){
									instance_destroy(weapon);
									weapon = instance_create(x, y, global.pawnweapon_object[PawnWeapon.Grenade]);
							        weapon.owner = id;
							        weapon_index = PawnWeapon.Grenade;
								}else{
									weapon.attack = true;
								}
							
								attack_time = attack_time_max;
							}
						}
					}
				}
			}
			
			if (runaway_starttime > 0){
				runaway_starttime --;
			}else if (runaway_starttime != -2){
				runaway_starttime = -2;
				runaway_time = 17;
			}
			
			/*if (distance_to_object(obj_player) > 85){
				move_x_to = obj_player.x;
				move_y_to = obj_player.y;
				move_speed = 1.5;
				
				if (distance_to_object(obj_player) > 130){
					move_speed = 2.1;
				}
			}*/
		}
		
		if (health_current == health_max){
			heal_can = false;
		}
		
		if (health_current < health_max - 1){
			heal_can = true;
		}
		
		if (heal_can){
			speed_multiplier = 0;
			
			if (heal_time > 0){
				heal_time--;
			}else{
				whiteflash_alpha = 0.7;
				health_scale = 1.5;
				health_current ++;
				scr_sound_play_distance(snd_object_health_pickup_0, false, 180);
				
				repeat(5){
					part_particles_create(global.ps_bottom, x + random_range(-4, 4), y + random_range(-4, 4), global.pt_wood_1, 1);
				}
				
				part_type_direction(global.pt_heal_0, 0, 360, 0, 0);
				
				repeat(14){
					part_particles_create(global.ps_front, x + random_range(-6, 6), y + random_range(-13, 13), global.pt_heal_0, 1);
				}
				
				heal_time = heal_time_max;
			}
		}
	}else{
		face_player = true;
		move_speed = 0;
		move_x_to = obj_player.x;
		move_y_to = obj_player.y;
	}
	
	distTo = distance_to_point(move_x_to, move_y_to);
	if (weapon_does_exist){
		if (distTo > 5){
			weapon.dir = point_direction(x, y, move_x_to, move_y_to);
		}
	}
	
	scr_companion_teleport();
}else{
	if (image_xscale == scale){
		weapon.dir = 360;
	}else{
		weapon.dir = 180;
	}
	
	move_speed = 0;
	face_player = false;
}

// Off - screen movement.
if (global.cutscene_current == -1){
	x = clamp(x, 22, room_width - 22);
	y = clamp(y, 22, room_height - 22);
}

// Dash
if (dash){
	image_speed = 0;
	
	if (dashtime > 0){
		dashtime --;
	}else{
		dash = false;
	}

	var trail = scr_effect_trail(sprite_index, 0.8, 0.075, 0, image_xscale, 1, 0.01, 0.5, (dashdirection - 180) + random_range(-30, 30));
	if (health_current <= floor(health_max / 3)) || (bleed){
		trail.special = "LowHealth";
	}
	
	part_particles_create(global.ps_front, x + random_range(-6, 6), y + random_range(-12, 12), global.pt_smoke_1, 2);
}

if (dashbreak > 0){
	dashbreak --;
}

// Moving
speed_final = move_speed * speed_multiplier * move_speed_offset;

if (move_speed_real < speed_final){
    move_speed_real += 0.2;
}else if (move_speed_real > speed_final){
    move_speed_real -= 0.2;
}

if (dash){
	if (!place_meeting(x + lengthdir_x(dashspeed + 2, dashdirection), y + lengthdir_y(dashspeed + 2, dashdirection), obj_p_solid)){
		x += lengthdir_x(dashspeed, dashdirection);
		y += lengthdir_y(dashspeed, dashdirection);
	}else{
		dash = false;
	}
}else{
	var dir = point_direction(x, y, move_x_to, move_y_to);
	while (place_meeting(x, y, obj_p_solid)){
		x += lengthdir_x(1, dir);
		y += lengthdir_y(1, dir);
	}
	
	mp_potential_step_object(move_x_to, move_y_to, move_speed_real, obj_p_solid);
}

// Facing
if (!face_player){
	if (distTo > 15){
		if (move_x_to > x) || (weapon.dir <= 90) || (weapon.dir >= 270){
			image_xscale = scale;
		}else{
			image_xscale = -scale;
		}
	}
}else{
	if (obj_player.x > x){
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
	
	Idle0 = spr_companion_1_idle_0; Walk0 = spr_companion_1_walk_0;
	Idle1 = spr_companion_1_idle_1; Walk1 = spr_companion_1_walk_1;
	Idle2 = spr_companion_1_idle_2; Walk2 = spr_companion_1_walk_2;
	
	if (speed_final <= 0.1){
		scr_pawn_sprite_weapon(global.pawnweapon_playerindex[weapon_index], Idle1, Idle0, Idle2);
	}else{
		scr_pawn_sprite_weapon(global.pawnweapon_playerindex[weapon_index], Walk1, Walk0, Walk2);
	}
}

if (speed_final <= 0.1) || (!instance_exists(obj_player)) || ((x == xprevious) && (y == yprevious)){
    image_speed = 0.05;
}else if (speed_final >= 0.1) && (speed_final <= 0.75){
    image_speed = 0.15;
}else if (speed_final < 1.1) && (speed_final > 0.75){
    image_speed = 0.25;
}else if (speed_final >= 1.1){
    image_speed = 0.35;
}
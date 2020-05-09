var speed_multiplier = 1;
var face_player = false;
var point_away = false;

if (instance_exists(obj_player)){
	var weapon_does_exist = false;
	
	if (weapon != -1){
		weapon_does_exist = instance_exists(weapon);
	}
	
	if (global.cutscene_current != -1){
		if (obj_player.move_x_to != -1) || (obj_player.move_y_to != -1){
			speed_multiplier *= obj_player.move_ext_spd / obj_player.spd_max;
		}
	}
	
	if (!in_cutscene){
		if (!instance_exists(target)){
			runaway_starttime = 0;
			runaway_time = 0;
			
			point_away = true;
			
			if (global.cutscene_current == -1) && (distance_to_object(obj_player) < 150) && (attack_time <= 0){
				var enemyCount = array_length_1d(global.enemy);
				
				for(var i = 0; i < enemyCount; i ++){
					if (i == 1){
						continue;
					}
					
					if (instance_exists(global.enemy[i])){
						target = instance_nearest(x, y, global.enemy[i]);
						
						if (target.object_index == obj_antagonist){
							if (target.walk_off){
								target = noone;
								continue;
							}
						}
						
						if (target.object_index == obj_thedogkeeper){
							if (!target.dogs_downed){
								var dog = instance_nearest(x, y, obj_thedogkeeper_dog);
								
								if (dog != noone){
									target = dog;
									continue;
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
				weapon.dir = (sign(image_xscale) == 1 ? 360 : 180);
			    weapon_index = PawnWeapon.Grenade;
			}
		
			var dist_to_player = distance_to_object(obj_player);
			
			if (dist_to_player > 70 + (companionspacing * order)) || (global.cutscene_current == 52){
				move_x_to = obj_player.x;
				move_y_to = obj_player.y + 6;
				move_speed = 2;
				attack_time = 0;
				
				if (dist_to_player > 100 + (companionspacing * order)){
					move_speed = 2.5;
				}
				
				if (dist_to_player > 140 + (companionspacing * order)){
					move_speed = 3;
				}
				
				if (dist_to_player > 180 + (companionspacing * order)){
					move_speed = 3.5;
				}
				
				face_player = true;
			}else{
				move_speed = 0;
				move_x_to = obj_player.x;
				move_y_to = obj_player.y + 6;
				face_player = true;
			}
		}else if (global.cutscene_current == -1){
			if (distance_to_object(obj_player) > 200){
				target = noone;
				runaway_time = 0;
				runaway_starttime = 0;
			}else{
				if (runaway_time > 0){
					runaway_time--;
		
					var dir = point_direction(target.x, target.y, x, y);
					move_x_to = target.x + lengthdir_x(30, dir);
					move_y_to = target.y + lengthdir_y(30, dir);
					move_speed = 1.8;
				}else{
					move_x_to = target.x;
					move_y_to = target.y + 6;
				
					if (distance_to_object(target) > 150) && (attack_time <= 0){
						move_speed = 1.8;
					}else{
						move_speed = 0;
						move_x_to = target.x;
						move_y_to = target.y + 6;
					
						if (weapon_does_exist){
							if (attack_time > 0){
								attack_time --;
							}else{
								if (!collision_line(x, y, target.x, target.y, obj_p_solid, false, true)){
									if (weapon_index == PawnWeapon.Knife){
										instance_destroy(weapon);
										weapon = instance_create(x, y, global.pawnweapon_object[PawnWeapon.Grenade]);
								        weapon.owner = id;
										weapon.dir = (sign(image_xscale) == 1 ? 360 : 180);
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
			}
		}
	}else{
		face_player = true;
		move_speed = 0;
		move_x_to = obj_player.x;
		move_y_to = obj_player.y + 6;
	}
	
	dist_to = distance_to_point(move_x_to, move_y_to);
	
	if (weapon_does_exist){
		if (dist_to > 5){
			weapon.dir = point_direction(x, y, move_x_to, move_y_to);
			
			if (weapon.dir <= 90 || weapon.dir >= 270){
				image_xscale = scale;
			}else{
				image_xscale = -scale;
			}
		}
	}
	
	if (!cutscene_prop){
		if (global.cutscene_current == 2) || (global.cutscene_current == 52) || (global.cutscene_current == 58){
			if (distance_to_object(obj_player) > 67 + (companionspacing * order)){
				move_x_to = obj_player.x;
				move_y_to = obj_player.y + 6;
				move_speed = 1.8;
			}
		}
	}
	
	scr_companion_teleport();
	scr_companion_healing();
}else{
	if (image_xscale == scale){
		weapon.dir = 360;
	}else{
		weapon.dir = 180;
	}
	
	move_speed = 0;
	face_player = false;
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
    move_speed_real += min(0.1, speed_final - move_speed_real);
}else if (move_speed_real > speed_final){
    move_speed_real -= min(0.2, move_speed_real - speed_final);
}

if (dash){
	if (!place_meeting(x + lengthdir_x(dashspeed + 2, dashdirection), y + lengthdir_y(dashspeed + 2, dashdirection), obj_p_solid)){
		x += lengthdir_x(dashspeed, dashdirection);
		y += lengthdir_y(dashspeed, dashdirection);
	}else{
		dash = false;
	}
}else{
	if (!scr_pawn_find_path()){
		move_speed_real = 0;
		speed_final = 0;
	}
}

// Animation
if (instance_exists(weapon) && weapon != -1){
	scr_pawn_human_facing();
	
	var Idle0, Walk0;
	var Idle1, Walk1;
	var Idle2, Walk2;
	
	Idle0 = spr_companion_1_idle_0; Walk0 = spr_companion_1_walk_0;
	Idle1 = spr_companion_1_idle_1; Walk1 = spr_companion_1_walk_1;
	Idle2 = spr_companion_1_idle_2; Walk2 = spr_companion_1_walk_2;
	
	if (speed_final <= 0.4){
		scr_pawn_sprite_weapon(global.pawnweapon_playerindex[weapon_index], Idle1, Idle0, Idle2);
	}else{
		scr_pawn_sprite_weapon(global.pawnweapon_playerindex[weapon_index], Walk1, Walk0, Walk2);
	}
}

if (speed_final <= 0.4) || (!instance_exists(obj_player)) || ((x == xprevious) && (y == yprevious)){
    image_speed = 0.05;
}else if (speed_final >= 0.4) && (speed_final <= 0.75){
    image_speed = 0.15;
}else if (speed_final < 1.1) && (speed_final > 0.75){
    image_speed = 0.25;
}else if (speed_final >= 1.1){
    image_speed = 0.35;
}
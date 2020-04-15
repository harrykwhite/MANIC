var speed_multiplier = 1;
var face_player = false;
var point_away = false;
var speed_final;
var dist_to = 0;

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
	
	if (weapon_does_exist) && (weapon_index != PawnWeapon.Knife){
		if (!in_cutscene){
			if (!instance_exists(target) || (target == noone)){
				runaway_starttime = 0;
				runaway_time = 0;
				
				point_away = true;
				
				if (global.cutscene_current == -1) && (distance_to_object(obj_player) < 150){
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
						
							if (target.cutscene_prop) || (collision_line(x, y, target.x, target.y, obj_p_solid, false, true)) || (distance_to_object(target) > 300){
								target = noone;
								continue;
							}
						}
					}
				}
				
				var dist_to_player = distance_to_object(obj_player);
			
				if (dist_to_player > 70 + (companionspacing * order)) || (global.cutscene_current == 52){
					move_x_to = obj_player.x;
					move_y_to = obj_player.y + 6;
					move_speed = 2.1;
					
					if (dist_to_player > 100 + (companionspacing * order)){
						move_speed = 2.6;
					}
					
					if (dist_to_player > 140 + (companionspacing * order)){
						move_speed = 3.1;
					}
					
					if (dist_to_player > 180 + (companionspacing * order)){
						move_speed = 3.6;
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
					return;
				}
				
				if (runaway_time > 0){
					runaway_time--;
					
					move_x_to = target.x + lengthdir_x(30, runaway_dir);
					move_y_to = target.y + 6 + lengthdir_y(30, runaway_dir);
					move_speed = 1.9;
				}else{
					move_x_to = target.x;
					move_y_to = target.y + 6;
				
					if (distance_to_object(target) > 44 + (companionspacing * order)){
						move_speed = 1.9;
					}else{
						move_speed = 0;
						
						if (weapon_does_exist){
							if (attack_time > 0){
								attack_time --;
								
								if (is_throwing){
									weapon.flicker = true;
								}
							}else{
								if (is_throwing){
									var throw = instance_create(x, y, obj_weapondrop);
								    throw.index = global.pawnweapon_playerindex[weapon_index];
								    throw.spd = 9;
								    throw.damage = 3;
								    throw.dir = weapon.dir;
								    throw.angle = throw.dir;
								    throw.ammo = -1;
									throw.dataset = true;
									
									instance_destroy(weapon);
									weapon = instance_create(x, y, obj_pawnweapon_3);
									weapon.owner = id;
									weapon.dir = (sign(image_xscale) == 1 ? 360 : 180);
									weapon_index = PawnWeapon.Knife;
									attack_time = attack_time_max;
									is_throwing = false;
								}else{
									weapon.attack = true;
									attack_time = attack_time_max;
									
									if (random(5) < 1) && (health_current < 3){
										is_throwing = true;
									}else{
										is_throwing = false;
									}
								}
							}
						}
					}
				}
			
				if (runaway_starttime > 0){
					runaway_starttime--;
				}else if (runaway_starttime != -2){
					runaway_starttime = -2;
					runaway_time = 34;
				}
			}
		}else{
			face_player = true;
			move_speed = 0;
			move_x_to = obj_player.x;
			move_y_to = obj_player.y + 6;
		}
	}else{
		if (!instance_exists(pickup_drop)){
			var drops = ds_list_create();
			var drop_count = collision_circle_list(x, y, 500, obj_weapondrop, false, true, drops, true);
		
			for(var d = 0; d < drop_count; d ++){
				var drop = drops[| d];
				var found = false;
			
				switch(drop.index){
					case PlayerWeapon.Axe:
					case PlayerWeapon.Crowbar:
					case PlayerWeapon.Stick:
					case PlayerWeapon.Machete:
					case PlayerWeapon.Rake:
						pickup_drop = drop;
						found = true;
						break;
				}
			
				if (found){
					break;
				}
			}
		
			ds_list_destroy(drops);
		}
		
		if (instance_exists(pickup_drop)){
			var dropdist = point_distance(x, y, pickup_drop.x, pickup_drop.y);
			
			move_x_to = pickup_drop.x;
			move_y_to = pickup_drop.y;
			move_speed = 1.9;
			
			if (dropdist < 20){
				var wind = -1;
				
				switch(pickup_drop.index){
					case PlayerWeapon.Axe:
						wind = PawnWeapon.Axe;
						break;
					
					case PlayerWeapon.Crowbar:
						wind = PawnWeapon.Crowbar;
						break;
					
					case PlayerWeapon.Stick:
						wind = PawnWeapon.Stick;
						break;
					
					case PlayerWeapon.Machete:
						wind = PawnWeapon.Machete;
						break;
					
					case PlayerWeapon.Rake:
						wind = PawnWeapon.Rake;
						break;
				}
				
				instance_destroy(weapon);
				weapon = instance_create(x, y, global.pawnweapon_object[wind]);
				weapon.owner = id;
				weapon.dir = (sign(image_xscale) == 1 ? 360 : 180);
				weapon_index = wind;
				attack_time = attack_time_max;
				pickup_drop = noone;
			}
		}
	}
	
	dist_to = distance_to_point(move_x_to, move_y_to);
	
	if (weapon_does_exist){
		if (dist_to > 3){
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
				move_speed = 1.9;
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
	
	face_player = false;
	move_speed = 0;
}

// Dash
if (dash){
	image_speed = 0;
	
	if (dashtime > 0){
		dashtime--;
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
	if (!place_meeting(x + lengthdir_x(dashspeed + 1, dashdirection), y + lengthdir_y(dashspeed + 1, dashdirection), obj_p_solid)){
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
	
	Idle0 = spr_companion_2_idle_0; Walk0 = spr_companion_2_walk_0;
	Idle1 = spr_companion_2_idle_1; Walk1 = spr_companion_2_walk_1;
	Idle2 = spr_companion_2_idle_2; Walk2 = spr_companion_2_walk_2;
	
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
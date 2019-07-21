var speed_multiplier = 1.25;
var face_player = false;
var speed_final;
var distTo = 0;

if (instance_exists(obj_player)){
	var weapon_does_exist = false;
	
	if (weapon != -1){
		weapon_does_exist = instance_exists(weapon);
	}
	
	if (weapon_does_exist) && (weapon_index != PawnWeapon.Knife){
		if (!in_cutscene){
			if (!instance_exists(target) || (target == noone)){
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
						
							if (target.cutscene_prop) || (collision_line(x, y, target.x, target.y, obj_p_solid, false, true)) || (distance_to_object(target) > 300){
								target = noone;
								continue;
							}
						}
					}
				
					if (health_current < 5){
						speed_multiplier = 0;
				
						if (heal_time > 0){
							heal_time--;
						}else{
							whiteflash_alpha = 0.7;
							health_scale = 1.5;
							health_current += 2;
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
						move_speed = 1.4;
						move_time = 35;
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
						
							move_time = random_range(30, 60) * 3;
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
					move_speed = 1.8;
				}else{
					move_x_to = target.x;
					move_y_to = target.y;
				
					if (distance_to_object(target) > 28){
						move_speed = 1.4;
					}else{
						move_speed = 0;
						move_x_to = target.x;
						move_y_to = target.y;
						
						if (weapon_does_exist){
							if (attack_time > 0){
								attack_time --;
							}else{
								if (random(5) < 1) && (health_current < 3){
									var throw = instance_create(x, y, obj_weapondrop);
								    throw.index = global.pawnweapon_playerindex[weapon_index];
								    throw.spd = 9;
								    throw.damage = 3;
								    throw.dir = weapon.dir;
								    throw.image_angle = throw.dir;
								    throw.ammo = -1;
									throw.ammodetermined = true;
									
									instance_destroy(weapon);
									weapon = instance_create(x, y, obj_pawnweapon_3);
									weapon.owner = id;
									weapon_index = PawnWeapon.Knife;
									attack_time = attack_time_max;
								}else{
									if (weapon.attack_time <= 0) && (target.target == id){
										runaway_starttime = 2;
									}
									
									weapon.attack = true;
									attack_time = attack_time_max;
								}
							}
						}
					}
				}
			
				if (runaway_starttime > 0){
					runaway_starttime--;
				}else if (runaway_starttime != -2){
					runaway_starttime = -2;
					runaway_time = 14;
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
		}else{
			face_player = true;
			move_speed = 0;
			move_x_to = obj_player.x;
			move_y_to = obj_player.y;
		}
	}else{
		var nearest_drop = instance_nearest(x, y, obj_weapondrop);
		var run_to_drop = false;
		
		if (nearest_drop != noone){
			var dropdist = point_distance(x, y, nearest_drop.x, nearest_drop.y);
			
			if (nearest_drop.index == PlayerWeapon.Axe)
			|| (nearest_drop.index == PlayerWeapon.Crowbar)
			|| (nearest_drop.index == PlayerWeapon.Stick)
			|| (nearest_drop.index == PlayerWeapon.Machete){
				if (dropdist < 200){
					move_x_to = nearest_drop.x;
					move_y_to = nearest_drop.y;
					move_speed = 1.2;
					run_to_drop = true;
					
					if (dropdist < 20){
						var wind = -1;
						
						switch(nearest_drop.index){
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
						}
						
						instance_destroy(weapon);
						weapon = instance_create(x, y, global.pawnweapon_object[wind]);
						weapon.owner = id;
						weapon_index = wind;
						attack_time = attack_time_max;
					}
				}
			}
		}
	}
	
	distTo = distance_to_point(move_x_to, move_y_to);
	if (weapon_does_exist){
		if (distTo > 3){
			weapon.dir = point_direction(x, y, move_x_to, move_y_to);
			
			if (weapon.dir <= 90 || weapon.dir >= 270){
				image_xscale = scale;
			}else{
				image_xscale = -scale;
			}
		}
	}
	
	scr_companion_teleport();
}else{
	if (image_xscale == scale){
		weapon.dir = 360;
	}else{
		weapon.dir = 180;
	}
	
	face_player = false;
	move_speed = 0;
}

// Off - screen movement.
if (global.cutscene_current == -1){
	x = clamp(x, 22, room_width - 22);
	y = clamp(y, 22, room_height - 22);

	if (!onscreen(x, y)){
		speed_multiplier = 0;
	}
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
    move_speed_real += 0.2;
}else if (move_speed_real > speed_final){
    move_speed_real -= 0.2;
}

if (dash){
	if (!place_meeting(x + lengthdir_x(dashspeed + 1, dashdirection), y + lengthdir_y(dashspeed + 1, dashdirection), obj_p_solid)){
		x += lengthdir_x(dashspeed, dashdirection);
		y += lengthdir_y(dashspeed, dashdirection);
	}else{
		dash = false;
	}
}else{
	scr_pawn_find_path();
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
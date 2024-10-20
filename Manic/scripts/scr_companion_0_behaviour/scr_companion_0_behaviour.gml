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
			if (obj_player.move_ext_spd > 0){
				speed_multiplier *= obj_player.move_ext_spd / obj_player.spd_max;
			}
		}
	}
	
	if (!in_cutscene) && (!depart) && (!depart_standaway) && (!bunker_engine_destroy){
		if (!instance_exists(target)){
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
						
						if (target.object_index == obj_thedogkeeper_dog){
							if (instance_exists(target)){
								if (target.keeper.cutscene_prop) || (target.keeper.in_cutscene){
									target = noone;
									continue;
								}
							}else{
								target = noone;
								continue;
							}
						}
						
						if (target.object_index == obj_thedogkeeper){
							if (target.cutscene_prop) || (target.in_cutscene){
								target = noone;
								continue;
							}
							
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
			
			if (dist_to_player > 70 + (companionspacing * order)){
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
			}else{
				if (runaway_time > 0){
					runaway_time --;
				
					var dir = point_direction(target.x, target.y, x, y);
					move_x_to = target.x + lengthdir_x(30, dir);
					move_y_to = target.y + lengthdir_y(30, dir);
					move_speed = 1.9;
				}else{
					move_x_to = target.x;
					move_y_to = target.y + 6;
				
					var tdist = 44 + global.level_current;
					tdist += 15 * order;
				
					if (distance_to_object(target) > tdist){
						move_speed = 1.9;
					}else{
						move_speed = 0;
						move_x_to = target.x;
						move_y_to = target.y + 6;
					
						if (weapon_does_exist){
							if (attack_time > 0){
								attack_time --;
							}else{
								weapon.attack = true;
								attack_time = attack_time_max;
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
		}else{
			move_speed = 0;
		}
	}else{
		var pdir = point_direction(x, y, obj_player.x, obj_player.y);
		face_player = false;
		move_time = 1;
		
		if (!bunker_engine_destroy){
			if (depart){
				move_x_to = x;
				move_y_to = room_height;
			
				if (distance_to_point(move_x_to, move_y_to) > 32 + (companionspacing * order)){
					move_speed = 1.9;
				}else{
					move_speed = 0;
				}
			}else if (depart_standaway){
				var xx = obj_player.x + 10;
				var yy = obj_player.y + 95;
				
				if (!depart_standaway_reached){
					move_x_to = xx;
					move_y_to = yy;
					move_speed = 1.9;
					
					if (distance_to_point(xx, yy) <= 20 + (companionspacing * order)){
						depart_standaway_reached = true;
					}
				}else{
					face_player = true;
					
					move_speed = 0;
					move_x_to = obj_player.x;
					move_y_to = obj_player.y + 6;
				}
			}else{
				if (distance_to_object(obj_player) > 67 + (companionspacing * order)){
					move_speed = 1.9;
				}else{
					face_player = true;
					move_speed = 0;
				
					if (weapon_does_exist){
						weapon.dir = pdir;
					}
				}
		
				move_x_to = obj_player.x;
				move_y_to = obj_player.y + 6;
			}
		}else{
			var engine = instance_nearest(x, y, obj_conveyerbelt_4);
			weapon.attack = false;
			
			move_x_to = obj_player.x;
			move_y_to = obj_player.y + 6;
			move_speed = 0;
			
			if (engine != noone){
				if (point_distance(obj_player.x, obj_player.y, engine.x, engine.y + 18) < 600){
					if (point_distance(x, y, engine.x, engine.y + 18) > 60){
						move_x_to = engine.x;
						move_y_to = engine.y + 18;
						move_speed = 1.9;
					}
				}
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
		if (global.cutscene_current == 2) || ((global.cutscene_current == 58 || global.cutscene_current == 52) && (!depart) && (!depart_standaway) && (!bunker_engine_destroy)){
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
	
	Idle0 = spr_companion_0_idle_0; Walk0 = spr_companion_0_walk_0;
	Idle1 = spr_companion_0_idle_1; Walk1 = spr_companion_0_walk_1;
	Idle2 = spr_companion_0_idle_2; Walk2 = spr_companion_0_walk_2;
	
	if (speed_final <= 0.4){
		scr_pawn_sprite_weapon(global.pawnweapon_playerindex[weapon_index], Idle1, Idle0, Idle2);
	}else{
		scr_pawn_sprite_weapon(global.pawnweapon_playerindex[weapon_index], Walk1, Walk0, Walk2);
	}
}

if (speed_final <= 0.4) || (!instance_exists(obj_player)) || ((x == xprevious) && (y == yprevious)){
    image_speed = 0.05;
}else if (speed_final > 0.4) && (speed_final <= 0.75){
    image_speed = 0.15;
}else if (speed_final < 1.1) && (speed_final > 0.75){
    image_speed = 0.25;
}else if (speed_final >= 1.1){
    image_speed = 0.35;
}
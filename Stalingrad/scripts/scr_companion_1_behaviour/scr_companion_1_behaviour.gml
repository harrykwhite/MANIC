var speed_multiplier = 0.9;
var face_player = false;
var speed_final;
var distTo = 0;

if (instance_exists(global.player)){
	var weapon_does_exist = false;
	
	if (weapon != -1){
		weapon_does_exist = instance_exists(weapon);
	}
	
	if (!in_cutscene){
		if (!instance_exists(target) || (target == noone)){
			var enemyCount = array_length_1d(global.enemy);
			for(var i = 0; i < enemyCount; i++){
				if (instance_exists(global.enemy[i])){
					target = instance_nearest(x, y, global.enemy[i]);
				
					if (collision_line(x, y, target.x, target.y, obj_p_solid, false, true)){
						target = noone;
					}
				
					if (distance_to_object(target) > 70){
						target = noone;
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
		
			if (distance_to_object(global.player) > 70) || (global.cutscene_current == 52){
				move_xTo = global.player.x;
				move_yTo = global.player.y;
				move_speed = 1.8;
				
				if (distance_to_object(global.player) > 100){
					move_speed = 2.1;
				}
			
				face_player = true;
			}else{
				if (distance_to_point(move_xTo, move_yTo) > 27){
					move_speed = 1.3;
					move_time = 35;
				}else{
					move_speed = 0;
					if (move_time > 0){
						move_time--;
					}else{
						var attempts = 0;
						move_xTo = global.player.x + lengthdir_x(35, random(360));
						move_yTo = global.player.y + lengthdir_y(35, random(360));
						
						while(distance_to_point(move_xTo, move_yTo) < 15) || (collision_line(x, y, move_xTo, move_yTo, obj_p_solid, false, true)){
							move_xTo = global.player.x + lengthdir_x(35, random(360));
							move_yTo = global.player.y + lengthdir_y(35, random(360));
							
							if (attempts < 200){
								attempts++;
							}else{
								break;
							}
						}
					}
				}
			}
		}else{
			if (runaway_time > 0){
				runaway_time--;
		
				var dir = point_direction(target.x, target.y, x, y);
				move_xTo = target.x + lengthdir_x(500, dir);
				move_yTo = target.y + lengthdir_y(500, dir);
				move_speed = 2;
			}else{
				move_xTo = target.x;
				move_yTo = target.y;
				
				if (distance_to_object(target) > 138){
					move_speed = 1.2;
				}else{
					move_speed = 0;
					if (!collision_line(x, y - 6, target.x, target.y, obj_p_solid, false, false)){
						if (weapon_does_exist){
							if (attack_time > 0){
								attack_time --;
							}else{
								if (weapon.attack_time <= 0){
									runaway_starttime = 2;
								}
							
								if (weapon_index == -1) || (weapon_index == PawnWeapon.Knife){
									instance_destroy(weapon);
									weapon = instance_create(x, y, obj_pawnweapon_4);
									weapon.owner = id;
									weapon_index = PawnWeapon.Grenade;
									attack_time = attack_time_max;
									exit;
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
				runaway_time = 24;
			}
			
			/*if (distance_to_object(global.player) > 85){
				move_xTo = global.player.x;
				move_yTo = global.player.y;
				move_speed = 1.5;
				
				if (distance_to_object(global.player) > 130){
					move_speed = 2.1;
				}
			}*/
		}
	}else{
		if (distance_to_object(global.player) > 27){
			move_speed = 1;
		}else{
			move_speed = 0;
		}
		
		move_xTo = global.player.x;
		move_yTo = global.player.y;
	}
	
	distTo = distance_to_point(move_xTo, move_yTo);
	if (weapon_does_exist){
		if (distTo > 10){
			weapon.dir = point_direction(x, y, move_xTo, move_yTo);
		}
	}
}else{
	move_speed = 0;
}

// Off - screen movement.
x = clamp(x, 22, room_width - 22);
y = clamp(y, 22, room_height - 22);

if (!onscreen(x, y)){
	speed_multiplier = 0;
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
	mp_potential_step_object(move_xTo, move_yTo, move_speed_real, obj_p_solid);
}

// Facing
if (face_player == false){
	if (distTo > 15){
		if (move_xTo > x){
			image_xscale = scale;
		}else{
			image_xscale = -scale;
		}
	}
}else{
	if (global.player.x > x){
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
	
	if (speed_final < 0.1){
		scr_pawn_sprite_weapon(global.pawnweapon_realindex[weapon_index], Idle1, Idle0, Idle2);
	}else{
		scr_pawn_sprite_weapon(global.pawnweapon_realindex[weapon_index], Walk1, Walk0, Walk2);
	}
}

if (speed_final < 0.1) || (!instance_exists(global.player)) || ((x == xprevious) && (y == yprevious)){
    image_speed = 0.05;
}else if (speed_final >= 0.1) && (speed_final <= 0.75){
    image_speed = 0.15;
}else if (speed_final < 1.1) && (speed_final > 0.75){
    image_speed = 0.25;
}else if (speed_final >= 1.1){
    image_speed = 0.35;
}
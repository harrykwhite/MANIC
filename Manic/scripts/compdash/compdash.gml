var speed_multiplier = 1;
var face_player = false;
var speed_final;

if (instance_exists(obj_player)){
	var weapon_does_exist = false;
	
	if (weapon != -1){
		weapon_does_exist = instance_exists(weapon);
	}
	
	if (!in_cutscene) && (!cutscene_prop){
		if (!instance_exists(target) || (target == noone)){
			if (instance_exists(obj_enemy_0)){
				target = instance_nearest(x, y, obj_enemy_0);
			
				if (collision_line(x, y, target.x, target.y, obj_p_solid, false, true)){
					target = noone;
				}
			
				if (distance_to_object(target) > 140){
					target = noone;
				}
			}
		
			if (distance_to_object(obj_player) > 70) || (global.cutscene_current == 52){
				move_x_to = obj_player.x;
				move_y_to = obj_player.y;
				move_speed = 1;
			
				if (distance_to_object(obj_player) > 95){
					if (dashbreak <= 0){
						dash = true;
						dashdirection = point_direction(x, y, move_x_to, move_y_to);
						dashspeed = 5.2;
						dashtime = 8;
						dashbreak = 25;
					}
				}
			
				face_player = true;
			}else{
				if (distance_to_point(move_x_to, move_y_to) > 14){
					move_speed = 1;
					move_time = 45;
				}else{
					if (move_time > 0){
						move_speed = 0;
						move_time--;
					}else{
						move_x_to = obj_player.x + lengthdir_x(20, random(360));
						move_y_to = obj_player.y + lengthdir_y(20, random(360));
					
						while(distance_to_point(move_x_to, move_y_to) < 7){
							move_x_to = obj_player.x + lengthdir_x(20, random(360));
							move_y_to = obj_player.y + lengthdir_y(20, random(360));
						}
					}
				}
			}
		}else{
			if (distance_to_object(target) > 33){
				move_speed = 1.1;
				if (distance_to_object(target) > 70){
					if (dashbreak <= 0){
						dash = true;
						dashdirection = point_direction(x, y, move_x_to, move_y_to);
						dashspeed = 5.2;
						dashtime = 8;
						dashbreak = 25;
					}
				}
			}else{
				move_speed = 0;
				if (weapon_does_exist){
					if (attack_time > 0){
						attack_time --;
					}else{
						weapon.attack = true;
						attack_time = attack_time_max * attack_time_offset;
					}
				}
			}
		
			move_x_to = target.x;
			move_y_to = target.y;
		
			if (distance_to_object(obj_player) > 235){
				move_x_to = obj_player.x;
				move_y_to = obj_player.y;
				move_speed = 1;
				if (dashbreak <= 0){
					dash = true;
					dashdirection = point_direction(x, y, move_x_to, move_y_to);
					dashspeed = 5.2;
					dashtime = 8;
					dashbreak = 25;
				}
			}
		}
	}else{
		move_x_to = obj_player.x;
		move_y_to = obj_player.y;
		move_speed = 1;
		
		if (dashbreak <= 0){
			dash = true;
			dashdirection = point_direction(x, y, move_x_to, move_y_to);
			dashspeed = 5.2;
			dashtime = 8;
			dashbreak = 25;
		}
	}
	
	if (weapon_does_exist){
		weapon.dir = point_direction(x, y, move_x_to, move_y_to);
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
	scr_pawn_find_path();
}

// Facing
if (!face_player){
	if (move_x_to > x){
		image_xscale = scale;
	}else{
		image_xscale = -scale;
	}
}else{
	if (obj_player.x > x){
		image_xscale = scale;
	}else{
		image_xscale = -scale;
	}
}

// Animation
if (instance_exists(weapon) && weapon != -1){
	
	var Idle0, Walk0;
	var Idle1, Walk1;
	var Idle2, Walk2;
	
	Idle0 = spr_enemy_0_idle_0; Walk0 = spr_enemy_0_walk_0;
	Idle1 = spr_enemy_0_idle_1; Walk1 = spr_enemy_0_walk_1;
	Idle2 = spr_enemy_0_idle_2; Walk2 = spr_enemy_0_walk_2;
	
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
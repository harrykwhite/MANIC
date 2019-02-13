var speed_multiplier = 1;
var speed_final = 0;
target = global.player;

if (instance_exists(target)){
	var csize = array_length_1d(global.companion);
	for(var i = 0; i < csize; i++){
		if (instance_exists(global.companion[i])){
			var nearest = instance_nearest(x, y, global.companion[i]);
			if (distance_to_object(nearest) < 50){
				target = nearest;
			}
		}
	}
	
	if (sniperboss_opening){
		if (sniperboss_movetime > 0){
			sniperboss_movetime -= 1.5;
		}else{
			move_xTo = target.x + random_range(-30, 30);
			move_yTo = target.y + random_range(-30, 30);

			sniperboss_dash = true;
			sniperboss_dashdirection = point_direction(x, y, move_xTo, move_yTo);
			sniperboss_dashspeed = 5.2;
			sniperboss_dashtime = 15;
			
			sniperboss_movetime = 60 * 1.4;
		}
		
		if (distance_to_object(target) < 60){
			sniperboss_opening = false;
		}
	}else{
		if (sniperboss_movetime > 0){
			sniperboss_movetime --;
			
			if (sniperboss_melee){
				if (distance_to_point(move_xTo, move_yTo) < 30){
					weapon.attack = true;
				}
			}
		}else{
			if (sniperboss_melee){
				var tries = 0;
				move_xTo = target.x + lengthdir_x(20, random(360));
				move_yTo = target.y + lengthdir_y(20, random(360));
				
				while(distance_to_point(move_xTo, move_yTo) < 5){
					move_xTo = target.x + lengthdir_x(20, random(360));
					move_yTo = target.y + lengthdir_y(20, random(360));
				
					if (tries < 100){
						tries++;
					}else{
						break;
					}
				}
		
				if (health_current <= (health_max / 2)){
					while(weapon_index == 2){
						sniperboss_melee = true;
						instance_destroy(weapon);
				
						weapon = instance_create(x, y, obj_pawnweapon_8);
						weapon.dir = 0;
						weapon.owner = self;
						weapon_index = 8;
					}
					
					sniperboss_dash = true;
					sniperboss_dashdirection = point_direction(x, y, move_xTo, move_yTo);
					sniperboss_dashspeed = 5.2;
					sniperboss_dashtime = 8;
				}
		
				sniperboss_movetime = 60 * 1.5;
			}else{
				var tries = 0;
				move_xTo = target.x + random_range(-120, 120);
				move_yTo = target.y + random_range(-120, 120);
			
				while(point_distance(move_xTo, move_yTo, target.x, target.y) < 90) || (distance_to_point(move_xTo, move_yTo) < 30){
					move_xTo = target.x + random_range(-120, 120);
					move_yTo = target.y + random_range(-120, 120);
				
					if (tries < 100){
						tries++;
					}else{
						break;
					}
				}
		
				if (health_current <= (health_max / 2)){
					sniperboss_dash = true;
					sniperboss_dashdirection = point_direction(x, y, move_xTo, move_yTo);
					sniperboss_dashspeed = 5.2;
					sniperboss_dashtime = 15;
				}
		
				sniperboss_movetime = 60 * 1.5;
			}
		}
	}
	
	if (place_meeting(x - 200, y, obj_pawn_other_train_0)) || (place_meeting(x + 200, y, obj_pawn_other_train_0)){
		move_xTo = x;
		move_yTo = y + 300;
		speed_multiplier ++;
	}
	
	if (weapon_index == PawnWeapon.SniperRifle){
		if (collision_line(x, y, target.x, target.y, obj_p_solid, false, true)){
			if (sniper_shotcancel < 40){
				sniper_shotcancel ++;
			}else{
				sniper_shotcancel = 0;
				weapon.attack_time = weapon.attack_time_max;
				weapon.line_alpha = -4.96;
				
				sniperboss_melee = true;
				instance_destroy(weapon);
		
				weapon = instance_create(x, y, obj_pawnweapon_2);
				weapon.dir = 0;
				weapon.owner = self;
				weapon_index = 2;
			}
		}
		
		if (weapon.attack_time < weapon.attack_time_max / 2){
			speed_multiplier = 0;
		}
	}
	
	if (distance_to_point(move_xTo, move_yTo) > 15){
		if (sniperboss_melee){
			move_speed = 2.1;
		}else{
			move_speed = 1.5;
		}
	}else{
		move_speed = 0;
		sniperboss_dash = false;
		sniperboss_dashtime = 0;
	}
	
	if (instance_exists(weapon)){
		weapon.dir = point_direction(x, y, target.x, target.y);
	}
}else{
	move_speed = 0;
}

// Off - screen movement.
x = clamp(x, 22, room_width - 22);
y = clamp(y, 22, room_height - 22);

move_xTo = clamp(move_xTo, 22, room_width - 22);
move_yTo = clamp(move_yTo, 22, room_height - 22);

if (!onscreen(x, y)){
	speed_multiplier = 0;
}

// Dash
if (sniperboss_dash){
	image_speed = 0;
	
	if (sniperboss_dashtime > 0){
		sniperboss_dashtime --;
	}else{
		sniperboss_dash = false;
	}

	var trail = scr_effect_trail(sprite_index, 0.8, 0.075, 0, image_xscale, 1, 0.01, 0.5, (sniperboss_dashdirection - 180) + random_range(-30, 30));
	if (health_current <= floor(health_max / 3)) || (bleed){
		trail.special = "LowHealth";
	}
	
	part_particles_create(global.ps_front, x + random_range(-6, 6), y + random_range(-12, 12), global.pt_smoke_1, 2);
}

// Moving
speed_final = move_speed * speed_multiplier * move_speed_offset;

if (move_speed_real < speed_final){
    move_speed_real += 0.2;
}else if (move_speed_real > speed_final){
    move_speed_real -= 0.2;
}

if (sniperboss_dash){
	if (!place_meeting(x + lengthdir_x(sniperboss_dashspeed + 1, sniperboss_dashdirection), y + lengthdir_y(sniperboss_dashspeed + 1, sniperboss_dashdirection), obj_p_solid)){
		x += lengthdir_x(sniperboss_dashspeed, sniperboss_dashdirection);
		y += lengthdir_y(sniperboss_dashspeed, sniperboss_dashdirection);
	}else{
		sniperboss_dash = false;
	}
}else{
	mp_potential_step_object(move_xTo, move_yTo, move_speed_real, obj_p_solid);
}

// Facing
if (instance_exists(target)){
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
	
	Idle0 = spr_enemy_0_sniperboss_idle_0; Walk0 = spr_enemy_0_sniperboss_walk_0;
	Idle1 = spr_enemy_0_sniperboss_idle_1; Walk1 = spr_enemy_0_sniperboss_walk_1;
	Idle2 = spr_enemy_0_sniperboss_idle_2; Walk2 = spr_enemy_0_sniperboss_walk_2;
	
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
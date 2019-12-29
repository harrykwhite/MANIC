var speed_multiplier = 1;
var speed_final = 0;
var face_player = true;
target = obj_player;

if (instance_exists(target)){
	var offs = ((1 - (health_current / health_max)) * 2);
	
	if (move_time > 0){
		move_time --;
	}else{
		move_x_to = obj_player.x + random_range(-120, 120);
		move_y_to = obj_player.y + random_range(-120, 120);
		
		weapon.attack = true;
		move_time = (weapon.attack_time_max / 4) * max(0.3, (health_current / health_max) * 0.8);
		
		var trials = 0;
		
		while(distance_to_point(move_x_to, move_y_to) < 20){
			move_x_to = obj_player.x + random_range(-120, 120);
			move_y_to = obj_player.y + random_range(-120, 120);
			
			if (trials < 100){
				trials ++;
			}else{
				trials = 0;
				break;
			}
		}
	}
	
	move_speed = 1.3 + offs;
	
	if (distance_to_point(move_x_to, move_y_to) < 18){
		move_speed = 0;
	}
	
	move_dir = point_direction(x, y, move_x_to, move_y_to);
	
	if (instance_exists(weapon) && weapon != -1){
		weapon.dir = point_direction(x, y, target.x, target.y + 6);
		
		if (weapon.attack_ready){
			speed_multiplier = 0;
		}
	}
}else{
	if (image_xscale == scale){
		weapon.dir = 360;
	}else{
		weapon.dir = 180;
	}
	
	move_speed = 0;
	face_player = false;
}

// Moving
speed_final = move_speed * speed_multiplier * move_speed_offset;

if (move_speed_real < speed_final){
    move_speed_real += min(0.2, speed_final - move_speed_real);
}else if (move_speed_real > speed_final){
    move_speed_real -= min(0.2, move_speed_real - speed_final);
}

if (!scr_pawn_find_path()){
	move_speed_real = 0;
	speed_final = 0;
}

// Animation
if (instance_exists(weapon) && weapon != -1){
	scr_pawn_human_facing();
	
	var Idle0, Walk0;
	var Idle1, Walk1;
	var Idle2, Walk2;
	
	Idle0 = spr_thedogkeeper_idle_0; Walk0 = spr_thedogkeeper_idle_0;
	Idle1 = spr_thedogkeeper_idle_1; Walk1 = spr_thedogkeeper_walk_1;
	Idle2 = spr_thedogkeeper_idle_1; Walk2 = spr_thedogkeeper_walk_1;
	
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
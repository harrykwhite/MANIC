var xpos, ypos;
target = obj_player;

if (instance_exists(target)){
	
	// Shooting
	if (attack == 0){
		attack_time_max = 60 * 8.5;
		
		if (shoot_buildup_time < 120){
			shoot_buildup_time ++;
		}
		
		if (shoot_time > 0){
			shoot_time --;
		}else{
			shoot_dir = point_direction(x, y, obj_player.x, obj_player.y);
			scr_sound_play(snd_weapon_shoot_1, false, 0.8, 1.2);
			scr_effect_screenshake(2);
			light_brightness = 1.25;
			
			var xpos = x + lengthdir_x(23 * scale, shoot_dir);
			var ypos = y + lengthdir_y(23 * scale, shoot_dir);
			
			part_type_direction(global.pt_smoke_4, shoot_dir - 6, shoot_dir + 6, 0, 0);
			for(var l = 0; l < 16; l += 4){
				part_particles_create(global.ps_front, xpos + lengthdir_x(-10 + l, shoot_dir) + random_range(-3, 3), ypos + lengthdir_y(-10 + l, shoot_dir) + random_range(-3, 3), global.pt_smoke_4, 1);
			}
			
			var bullet = instance_create(xpos, ypos, obj_proj_0);
			bullet.enemy = true;
			bullet.damage = 1;
			bullet.spd = 13;
			bullet.strength = 0.6;
			bullet.dir = shoot_dir;
			bullet.image_angle = bullet.dir;
			
			if (shoot_burst < 2){
				shoot_burst ++;
				shoot_time = 2;
			}else{
				shoot_burst = 0;
				shoot_time = 70;
			}
		}
		
	// Flamethrower
	}else if (attack == 1){
		attack_time_max = 60 * 11;
		
		if (flamethrower_angle_sign == 1){
			if (flamethrower_angle < 90){
				flamethrower_angle += 0.9;
				flamethrower_angle_wait = 80;
			}else{
				if (flamethrower_angle_wait > 0){
					flamethrower_angle_wait --;
				}else{
					flamethrower_angle_sign = -1;
				}
			}
		}else{
			if (flamethrower_angle > 0){
				flamethrower_angle -= 0.9;
				flamethrower_angle_wait = 80;
			}else{
				if (flamethrower_angle_wait > 0){
					flamethrower_angle_wait --;
				}else{
					flamethrower_angle_sign = 1;
				}
			}
		}
		
		if (flamethrower_time > 0){
			flamethrower_time --;
		}else{
			var has_flamethrowers = false;
			
			for(var i = 0; i < 4; i ++){
				if (instance_exists(flamethrower[i])){
					has_flamethrowers = true;
					flamethrower[i].shoot = true;
				}
			}
			
			if (!has_flamethrowers){
				attack_time = attack_time_max;
			}
		}
		
	// Break
	}else if (attack == 2){
		attack_time_max = 60 * 2.5;
	}
	
	if (attack_time < attack_time_max){
		attack_time ++;
	}else{
		if (attack < 2){
			attack ++;
		}else{
			attack = 0;
		}
		
		shoot_time = 120;
		shoot_burst = 0;
		shoot_buildup_time = 0;
		
		flamethrower_angle = 0;
		flamethrower_angle_wait = 80;
		flamethrower_time = 30;
		
		attack_time = 0;
	}
}
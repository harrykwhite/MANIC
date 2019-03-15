var xpos, ypos;
target = global.player;

if (instance_exists(target)){
	
	// Shooting
	if (attack == 0){
		if (shoot_time > 0){
			shoot_time --;
		}else{
			var dir_to_player = point_direction(x, y, global.player.x, global.player.y);
			xpos = x + lengthdir_x(22, dir_to_player);
			ypos = y + lengthdir_y(22, dir_to_player);
			
			scr_effect_screenshake(2);
			scr_sound_play(snd_weapon_shoot_0, false, 0.8, 1.2);
			light_brightness = 8;
			
			part_type_direction(global.pt_flash_0, dir_to_player - 17, dir_to_player + 17, 0, 0);
			part_particles_create(global.ps_front, xpos + random_range(-3, 3), ypos + random_range(-3, 3), global.pt_flash_0, 1);
	        part_type_direction(global.pt_smoke_5, dir_to_player - 17, dir_to_player + 17, 0, 0);
			part_particles_create(global.ps_front, xpos + lengthdir_x(5, dir_to_player) + random_range(-3, 3), ypos + lengthdir_y(5, dir_to_player) + random_range(-3, 3), global.pt_smoke_5, 1);
			
		    var bullet = instance_create(xpos, ypos, obj_proj_0);
			bullet.dir = dir_to_player;
		    bullet.image_angle = dir_to_player;
			bullet.spd = 13;
			bullet.damage = 1;
			bullet.strength = 1.25;
			bullet.enemy = true;
			bullet.creator = id;
			
			if (shoot_burst < 2){
				shoot_burst ++;
				shoot_time = 9;
			}else{
				shoot_burst = 0;
				shoot_time = 70;
			}
		}
		
	// Flamethrower
	}else if (attack == 1){
		attack_time_max = 60 * 15;
		
		flamethrower_angle += flamethrower_angle_increment;
		flamethrower_angle_increment += 0.005;
		flamethrower_angle_increment = min(0.25, flamethrower_angle_increment);
		
		if (flamethrower_time > 0){
			flamethrower_time --;
		}else{
			for(var i = 0; i < 5; i++){
				var ang = flamethrower_angle + (i * 72) + 36;
				xpos = x + lengthdir_x(22, ang);
				ypos = y + lengthdir_y(22, ang);
				
				part_type_direction(global.pt_flash_0, ang - 15, ang + 15, 0, 0);
				part_particles_create(global.ps_front, xpos + random_range(-3, 3), ypos + random_range(-3, 3), global.pt_flash_0, 1);
			    part_type_direction(global.pt_smoke_5, ang - 15, ang + 15, 0, 0);
				part_particles_create(global.ps_front, xpos + lengthdir_x(8, ang) + random_range(-3, 3), ypos + lengthdir_y(8, ang) + random_range(-3, 3), global.pt_smoke_5, 1);
				
				repeat(choose(3, 4)){
					var shoot = instance_create(xpos, ypos, obj_proj_5);
					shoot.dir = ang + random_range(-1, 1);
					shoot.image_xscale = 0.9;
					shoot.image_yscale = 0.9;
					shoot.image_angle = shoot.dir;
					shoot.damage = 2;
					shoot.strength = 1.5;
					shoot.spd = random_range(13, 18);
					shoot.creator = id;
					shoot.enemy = true;
				}
			}
		
			flamethrower_time = 6;
		}
		
	// Break
	}else if (attack == 2){
		attack_time_max = 60 * 2;
	}
	
	if (attack_time < attack_time_max){
		attack_time ++;
	}else{
		if (attack < 2){
			attack ++;
		}else{
			attack = 0;
		}
		
		shoot_time = 5;
		flamethrower_angle = 0;
		flamethrower_angle_increment = 0;
		flamethrower_time = 5;
		attack_time = 0;
	}
}
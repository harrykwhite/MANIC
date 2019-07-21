target = obj_player;

if (instance_exists(target)){
	if ((distance_to_object(target) < 180) || (initiated) || (shoot_in_burst)){
		dir_to = point_direction(x, y, target.x, target.y);
		var dirdiff = angle_difference(dir, dir_to);
		dir += min(abs(dirdiff), 10) * -sign(dirdiff);
		image_angle = dir;
		initiated = true;
		
		if (shoot_buildup_time > 0){
			shoot_buildup_time --;
		}else{
			if (shoot_time > 0){
				shoot_time --;
			}else{
				scr_sound_play(snd_weapon_shoot_1, false, 0.8, 1.2);
				scr_effect_screenshake(2);
				flash_time = 6;
				line_alpha = 0;
				
				var xpos = x + lengthdir_x(10, image_angle) + lengthdir_x(1, up(image_angle));
				var ypos = y + lengthdir_y(10, image_angle) + lengthdir_y(1, up(image_angle));
				part_type_direction(global.pt_smoke_4, image_angle - 6, image_angle + 6, 0, 0);
				part_particles_create(global.ps_front, xpos + lengthdir_x(3, image_angle) + random_range(-3, 3), ypos + lengthdir_y(3, image_angle) + random_range(-3, 3), global.pt_smoke_4, 2);
				
				var bullet = instance_create(x, y, obj_proj_0);
				bullet.enemy = true;
				bullet.damage = 1;
				bullet.spd = 15;
				bullet.strength = 1;
				bullet.dir = image_angle;
				bullet.image_angle = bullet.dir;
				
				if (shoot_burst_count < 2){
					shoot_burst_count ++;
					shoot_time = 3;
					shoot_in_burst = true;
				}else{
					line_alpha = 0;
					shoot_burst_count = 0;
					shoot_time = 150;
					shoot_in_burst = false;
				}
			}
		}
	}else{
		shoot_time = 0;
		shoot_buildup_time = 60;
	}
}else{
	shoot_time = 0;
	shoot_buildup_time = 0;
}
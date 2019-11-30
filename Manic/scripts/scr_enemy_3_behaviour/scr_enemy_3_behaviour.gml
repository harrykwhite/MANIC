target = obj_player;

if (instance_exists(target)){
	var dist = distance_to_object(target);
	
	if (((dist < 180) || (initiated)) && (dist < 330)) || (shoot_in_burst){
		dir_to = point_direction(x, y, target.x, target.y);
		
		var dirdiff = angle_difference(dir, dir_to);
		var dirinterv = 10;
		
		if (abs(dirdiff) < dirinterv){
			dir = dir_to;
		}else{
			dir += -sign(dirdiff) * dirinterv;
		}
		
		initiated = true;
		
		if (!cutscene_prop){
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
				
					var xpos = x + lengthdir_x(22, image_angle) + lengthdir_x(1, up(image_angle));
					var ypos = y + lengthdir_y(22, image_angle) + lengthdir_y(1, up(image_angle));
				
					part_type_direction(global.pt_smoke_4, image_angle - 6, image_angle + 6, 0, 0);
					for(var l = 0; l < 16; l += 4){
						part_particles_create(global.ps_front, xpos + lengthdir_x(-6 + l, image_angle) + random_range(-3, 3), ypos + lengthdir_y(-6 + l, image_angle) + random_range(-3, 3), global.pt_smoke_4, 1);
					}
				
					var bullet = instance_create(xpos, ypos, obj_proj_0);
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
		}
	}else{
		shoot_time = 0;
		shoot_buildup_time = 60;
	}
}else{
	shoot_time = 0;
	shoot_buildup_time = 0;
}
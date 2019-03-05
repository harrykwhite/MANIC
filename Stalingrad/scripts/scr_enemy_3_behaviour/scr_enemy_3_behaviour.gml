target = global.player;

if (instance_exists(target)){
	if (!collision_line(x, y, target.x, target.y, obj_p_solid, false, true)){
		image_angle = point_direction(x, y, target.x, target.y);
		
		if (shoot_buildup_time < 40){
			shoot_buildup_time ++;
		}else{
			if (shoot_time < 10){
				shoot_time ++;
			}else{
				scr_sound_play(snd_weapon_shoot_0, false, 0.8, 1.2);
				scr_effect_screenshake(2);
				
				var xpos = x + lengthdir_x(10, image_angle) + lengthdir_x(3, up(image_angle));
				var ypos = y + lengthdir_y(10, image_angle) + lengthdir_y(3, up(image_angle));
				part_type_direction(global.pt_flash_0, image_angle - 15, image_angle + 15, 0, 0);
				repeat(1) part_particles_create(global.ps_front, xpos + random_range(-3, 3), ypos + random_range(-3, 3), global.pt_flash_0, 1);
		        part_type_direction(global.pt_smoke_5, image_angle - 15, image_angle + 15, 0, 0);
				repeat(1) part_particles_create(global.ps_front, xpos + lengthdir_x(8, image_angle) + random_range(-3, 3), ypos + lengthdir_y(8, image_angle) + random_range(-3, 3), global.pt_smoke_5, 1);
				
				var bullet = instance_create(x, y, obj_proj_0);
				bullet.enemy = true;
				bullet.damage = 1;
				bullet.spd = 15;
				bullet.strength = 1;
				bullet.dir = image_angle;
				bullet.image_angle = bullet.dir;
				shoot_time = 0;
			}
		}
	}else{
		shoot_time = 0;
		shoot_buildup_time = 0;
	}
}else{
	shoot_time = 0;
	shoot_buildup_time = 0;
}
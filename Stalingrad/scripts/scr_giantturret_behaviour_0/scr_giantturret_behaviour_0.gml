target = global.player;

if (instance_exists(target)){
	// Flamethrower
	if (attack == 0){
		attack_time_max = 60 * 15;
		
		flamethrower_angle += flamethrower_angle_increment;
		flamethrower_angle_increment += 0.0025;
		flamethrower_angle_increment = min(0.75, flamethrower_angle_increment);
		
		if (flamethrower_time > 0){
			flamethrower_time --;
		}else{
			for(var i = 0; i < 4; i++){
				var ang = flamethrower_angle + (i * 90);
				var xpos = x + lengthdir_x(34, ang);
				var ypos = y + lengthdir_y(34, ang);
				
				part_type_direction(global.pt_flash_0, ang - 15, ang + 15, 0, 0);
				repeat(1) part_particles_create(global.ps_front, xpos + random_range(-3, 3), ypos + random_range(-3, 3), global.pt_flash_0, 1);
			    part_type_direction(global.pt_smoke_5, ang - 15, ang + 15, 0, 0);
				repeat(1) part_particles_create(global.ps_front, xpos + lengthdir_x(8, ang) + random_range(-3, 3), ypos + lengthdir_y(8, ang) + random_range(-3, 3), global.pt_smoke_5, 1);
				
				repeat(choose(3, 4)){
					shoot = instance_create(xpos, ypos, obj_proj_5);
					shoot.dir = ang + random_range(-5, 5);
					shoot.image_angle = shoot.dir;
					shoot.damage = 2;
					shoot.strength = 1.5;
					shoot.spd = random_range(15, 20);
					shoot.creator = id;
					shoot.enemy = true;
				}
			}
		
			flamethrower_time = 3;
		}
	}
	
	if (attack_time < attack_time_max){
		attack_time ++;
	}else{
		attack ++;
		attack_time = 0;
	}
}
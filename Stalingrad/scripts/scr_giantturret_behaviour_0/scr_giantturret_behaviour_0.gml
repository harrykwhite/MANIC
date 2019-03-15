target = global.player;

if (instance_exists(target)){
	// Flamethrower
	if (attack == 0){
		attack_time_max = 60 * 15;
		
		flamethrower_angle += flamethrower_angle_increment;
		flamethrower_angle_increment += 0.005;
		flamethrower_angle_increment = min(0.25, flamethrower_angle_increment);
		
		if (flamethrower_time > 0){
			flamethrower_time --;
		}else{
			for(var i = 0; i < 4; i++){
				var ang = flamethrower_angle + (i * 90);
				var xpos = x + lengthdir_x(22, ang);
				var ypos = y + lengthdir_y(22, ang);
				
				part_type_direction(global.pt_flash_0, ang - 15, ang + 15, 0, 0);
				part_particles_create(global.ps_front, xpos + random_range(-3, 3), ypos + random_range(-3, 3), global.pt_flash_0, 1);
			    part_type_direction(global.pt_smoke_5, ang - 15, ang + 15, 0, 0);
				part_particles_create(global.ps_front, xpos + lengthdir_x(8, ang) + random_range(-3, 3), ypos + lengthdir_y(8, ang) + random_range(-3, 3), global.pt_smoke_5, 1);
				
				repeat(choose(3, 4)){
					shoot = instance_create(xpos, ypos, obj_proj_5);
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
		
	// Enemy spawning
	}else if (attack == 1){
		var ecount = instance_number(obj_p_enemy);
		
		while(ecount < 5){
			var enemy = instance_create(random_range(288, 720), random_range(304, 592), obj_enemy_0);
			enemy.weapon_index = choose(PawnWeapon.Axe, PawnWeapon.Crowbar);
			ecount = instance_number(obj_p_enemy);
			
			repeat(9){
				part_particles_create(global.ps_front, enemy.x + random_range(-7, 7), enemy.y + random_range(-18, 18), global.pt_spawn_0, 1);
			}
		}
		
		attack_time_max = 60 * 10;
	}
	
	if (attack_time < attack_time_max){
		attack_time ++;
	}else{
		if (attack < 1){
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
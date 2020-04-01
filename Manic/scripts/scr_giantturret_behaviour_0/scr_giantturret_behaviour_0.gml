target = obj_player;

if (instance_exists(target)){
	// Flamethrower
	if (attack == 0){
		attack_time_max = 60 * 15;
		
		if (flamethrower_angle_sign == 1){
			if (flamethrower_angle < 90){
				flamethrower_angle += 0.45;
				flamethrower_angle_wait = 80;
			}else{
				if (flamethrower_angle_wait > 0){
					flamethrower_angle_wait --;
				}else{
					flamethrower_angle_sign = -1;
				}
			}
		}else if (flamethrower_angle_sign == -1){
			if (flamethrower_angle > 0){
				flamethrower_angle -= 0.45;
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
		
	// Enemy spawning
	}else if (attack == 1){
		while(instance_number(obj_p_enemy) < (instance_number(obj_giantturret_flamethrower) + 1) + 2){
			var enemy = instance_create(random_range(288, 720), random_range(304, 592), obj_enemy_0);
			enemy.weapon_index = choose(PawnWeapon.Sledgehammer, PawnWeapon.Katana, PawnWeapon.Axe, PawnWeapon.Machete);
			
			if (random(5) < 1){
				enemy.weapon_index = PawnWeapon.Grenade;
			}
			
			if (enemy.weapon_index == PawnWeapon.Grenade){
				enemy.type = Enemy0_Type.Grenadier;
			}else{
				enemy.type = Enemy0_Type.Normal;
			}
			
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
		
		shoot_time = 120;
		shoot_burst = 0;
		shoot_buildup_time = 0;
		
		flamethrower_angle = 0;
		flamethrower_angle_wait = 80;
		flamethrower_time = 30;
		
		attack_time = 0;
	}
}
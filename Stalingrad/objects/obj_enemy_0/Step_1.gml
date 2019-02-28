if (destroy){
	if (!fly_cutscene_prop)
	&& (!crazy_cutscene_prop)
	&& (!healer_cutscene_prop)
	&& (!grenadier_cutscene_prop)
	&& (!sniper_cutscene_prop){
		if (type != EnemyOneType.TrainBoss){
			instance_destroy();
		}
	}
	
	destroy = false;
}

if (!weapon_destroyed){
    if (weapon == -1){
        weapon = instance_create(x, y, global.pawnweapon_object[weapon_index]);
        weapon.owner = id;
        weapon.alphaTo = 0;
    }else if (!instance_exists(weapon)){
        weapon = instance_create(x, y, global.pawnweapon_object[weapon_index]);
        weapon.owner = id;
        weapon.alphaTo = 0;
    }
}

if (arm == -1) || (!instance_exists(arm)){
	arm = instance_create(x, y, obj_enemy_0_arm);
	arm.owner = id;
	show_debug_message("No arm found");
}

if (!typedet){
	weapon_original = weapon_index;
	
	switch(type){
		case EnemyOneType.Fast:
			scale = 0.905;
			defense = -1;
			break;
	
		case EnemyOneType.Large:
			defense = 2;
			scale = 1.115;
			knockback_resist = 0.7;
			break;
	
		case EnemyOneType.Mother:
			scale = 1.2;
			defense = 2;
			health_max = 11;
			health_current = health_max;
			attack_time_offset = 0.6;
			knockback_resist = 0.4;
			break;
		
		case EnemyOneType.Grenadier:
			scale = random_range(1.1, 1.125);
			defense = 1;
			break;
		
		case EnemyOneType.Sniper:
			scale = 1.1;
			defense = 2;
			health_max = 9;
			health_current = health_max;
			break;
		
		case EnemyOneType.Crazy:
			defense = 0;
			attack_time_offset = 0.6;
			break;
		
		case EnemyOneType.Healer:
			health_max = 2;
			health_current = health_max;
			defense = 3;
			scale -= 0.1;
			knockback_resist = 0.4;
			break;
		
		case EnemyOneType.Fly:
			scale = 1.125;
			defense = 3;
			attack_time_offset = 0.6;
			knockback_resist = 0.7;
			
			repeat(3){
				var fly = instance_create(x + random_range(-5, 5), y + random_range(-10, 10), obj_enemy_1);
				fly.owner = self;
			}
			
			break;
			
		case EnemyOneType.TrainBoss:
			scale = 1.1;
			defense = 0;
			health_max = 35;
			health_current = health_max;
			break;
	}
	
	if (type == EnemyOneType.Grenadier) || (type == EnemyOneType.Sniper) || (type == EnemyOneType.TrainBoss){
		mylight = instance_create(x, y - 9, obj_enemy_0_light);
	}
	
	typedet = true;
}
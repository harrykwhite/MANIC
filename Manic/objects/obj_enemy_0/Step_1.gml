if (destroy){
	if (!cutscene_prop){
		instance_destroy();
		if (type == Enemy0_Type.TrainBoss){
			with(obj_controller_levelsix){
				train_time = 0;
				train_timemax = 10 * 60;

				trainboss_trainhead = noone;
				trainboss_leader = noone;
				trainboss_time = 0;
				trainboss_timemax = 60 * 25;
				trainboss_spawned = false;
			}
			
			if (instance_exists(obj_pawn_other_train_1)){
				instance_destroy(obj_pawn_other_train_1);
			}
		}
	}
	
	destroy = false;
}

if (!weapon_destroyed){
    if (weapon == -1){
        weapon = instance_create(x, y, global.pawnweapon_object[weapon_index]);
        weapon.owner = id;
    }else if (!instance_exists(weapon)){
        weapon = instance_create(x, y, global.pawnweapon_object[weapon_index]);
        weapon.owner = id;
    }
}

if (arm == -1){
	arm = instance_create(x, y, obj_enemy_0_arm);
	arm.owner = id;
}

if (!instance_exists(arm)){
	arm = instance_create(x, y, obj_enemy_0_arm);
	arm.owner = id;
}

if (!typedet){
	weapon_original = weapon_index;
	
	switch(type){
		case Enemy0_Type.Mother:
			scale = 1.2;
			defense = 2;
			health_max = 9;
			health_current = health_max;
			attack_time_offset = 0.6;
			knockback_multiplier = 0.4;
			break;
		
		case Enemy0_Type.Grenadier:
			scale = random_range(1.1, 1.125);
			defense = 1;
			sprite_index = spr_enemy_0_light_idle_0;
			break;
		
		case Enemy0_Type.Sniper:
			scale = 1.1;
			defense = 2;
			health_max = 8;
			health_current = health_max;
			knockback_multiplier = 0.6;
			sprite_index = spr_enemy_0_light_idle_0;
			break;
		
		case Enemy0_Type.Crazy:
			defense = 0;
			attack_time_offset = 0.6;
			sprite_index = spr_enemy_0_brain_idle_0;
			break;
		
		case Enemy0_Type.Healer:
			health_max = 2;
			health_current = health_max;
			defense = 3;
			scale -= 0.1;
			knockback_multiplier = 0.4;
			sprite_index = spr_enemy_0_healer_idle_0;
			break;
		
		case Enemy0_Type.Fly:
			scale = 1.125;
			defense = 3;
			attack_time_offset = 0.6;
			knockback_multiplier = 0.7;
			
			repeat(3){
				var fly = instance_create(x + random_range(-5, 5), y + random_range(-10, 10), obj_enemy_1);
				fly.owner = self;
			}
			
			sprite_index = spr_enemy_0_fly_idle_0;
			break;
			
		case Enemy0_Type.TrainBoss:
			scale = 1.1;
			defense = 0;
			health_max = 45;
			health_current = health_max;
			sprite_index = spr_enemy_0_sniperboss_idle_0;
			break;
	}
	
	if (type == Enemy0_Type.Grenadier) || (type == Enemy0_Type.Sniper) || (type == Enemy0_Type.TrainBoss){
		mylight = instance_create_layer(x, y - 9, "Lights", obj_enemy_0_light);
	}
	
	if (global.level_current >= Level.HumanPrison){
		knockback_multiplier *= 0.95;
	}
	
	if (global.level_current >= Level.TheCemetery){
		knockback_multiplier *= 0.9;
	}
	
	if (global.level_current >= Level.IntoTheCity){
		knockback_multiplier *= 0.85;
	}
	
	typedet = true;
}
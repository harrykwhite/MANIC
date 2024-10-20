if (global.game_pause) || (global.cutscene_current != -1){
	image_speed = 0;
	return;
}

// Attacking
if (instance_exists(owner)){
	var attack_time_multiplier = 1;
	
	if (owner.type == Enemy0_Type.TrainBoss){
		if (owner.health_current <= (owner.health_max / 2)){
			attack_time_multiplier += 0.1;
		}
	}
	
	if (!owner.burn) && (!owner.cutscene_prop){
		if (line_alpha < 0.7){
			line_alpha += 0.02 * attack_time_multiplier;
		}
		
		if (attack_time > 0){
	        attack_time -= attack_time_multiplier;
	    }else{
			attack = true;
		}
	}else{
		line_alpha = -4.96;
		attack_time = attack_time_max;
	}
    
    if (attack) && (attack_time <= 0){
	    var xpos = x + lengthdir_x(22 * owner.scale, dir);
		var ypos = y + lengthdir_y(22 * owner.scale, dir);
		var isEnemy = true;
		
		if (collision_line(owner.x, owner.y + 4, xpos, ypos, obj_p_solid, false, true)){
			var dist = collision_distance_object(owner.x, owner.y + 4, xpos, ypos, obj_p_solid, 1);
			xpos -= lengthdir_x(22 * owner.scale, dir) + lengthdir_x(dist, dir);
			ypos -= lengthdir_y(22 * owner.scale, dir) + lengthdir_y(dist, dir);
		}
		
		scr_effect_screenshake(2);
		scr_sound_play(snd_weapon_shoot_0, false, 0.8, 1.2);
		owner.light_brightness = 1.25;
		
		part_type_direction(global.pt_smoke_4, dir - 6, dir + 6, 0, 0);
		for(var l = 0; l < 24; l += 4){
			part_particles_create(global.ps_front, xpos + lengthdir_x(-10 + l, dir) + random_range(-3, 3), ypos + lengthdir_y(-10 + l, dir) + random_range(-3, 3), global.pt_smoke_4, 1);
		}
		
		part_type_direction(global.pt_shell_0, (dir - 180) - 15, (dir - 180) + 15, 0, 0);
        part_particles_create(global.ps_bottom, x + lengthdir_x(3, dir) + random_range(-3, 3), y + 4 + lengthdir_y(3, dir) + random_range(-3, 3), global.pt_shell_0, choose(2, 3));
		
		if (owner.pawn == PawnType.Companion){
			isEnemy = false;
		}
		
		proj = instance_create(xpos, ypos, obj_proj_0);
		proj.dir = dir;
		proj.image_angle = dir;
		proj.spd = 15;
		proj.damage = scr_pawn_weapon_damage(0);
		proj.strength = 2.25;
		proj.enemy = isEnemy;
		proj.creator = owner;
		
	    owner.knockback_speed = -2;
	    owner.knockback_direction = dir;
		line_alpha = -4.96;
		
	    attack = false;
	    attack_time = attack_time_max;
		angle_offset = 10;
		
		if (owner.pawn == PawnType.Enemy){
			if (owner.type == Enemy0_Type.TrainBoss){
				if (owner.health_current >= (owner.health_max / 1.875)){
					with(owner){
						sniperboss_melee = true;
						instance_destroy(weapon);
						
						weapon = instance_create(x, y, obj_pawnweapon_2);
						weapon.dir = 0;
						weapon.owner = id;
						weapon_index = 2;
					}
				}
			}
		}
    }
}
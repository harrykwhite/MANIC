if (pawn == PawnType.Enemy) && (!other.damage_enemy){
	exit;
}

if (pawn == PawnType.Companion) && (!other.damage_companion){
	exit;
}

if (object_index == obj_enemy_1){
	if (owner != global.player) && (owner != noone){
		exit;
	}
}

if (object_index == obj_enemy_0) || (object_index == obj_enemy_2) || (object_index == obj_enemy_3) || (object_index == obj_thedogkeeper_dog) || (object_index == obj_thescorched) || (object_index == obj_thedogkeeper){
	if (cutscene_prop){
		exit;
	}
}

if (i_time <= 0){
	scr_pawn_damage(clamp(other.damage - defense, 1, 6), other.strength, random(360), 5);
	
	if (object_index == obj_enemy_0) || (object_index == obj_enemy_2) ||  (object_index == obj_thedogkeeper_dog){
		if (other.damage > 3) && (object_index == obj_enemy_0){
			if (type != EnemyOneType.Mother) && (type != EnemyOneType.Sniper) && (type != EnemyOneType.TrainBoss){
				headless = true;
			}
		}
		
		part_particles_create(global.ps_bottom, x, y + 6, global.pt_blood_1, 10);
		part_particles_create(global.ps_bottom, x, y + 6, global.pt_blood_3, 3);
	    part_particles_create(global.ps_bottom, x, y + 6, global.pt_gore_0, 3);
		part_type_direction(global.pt_blood_5, 0, 360, 0, 0);
		part_type_speed(global.pt_blood_5, 2.75, 3.75, -0.15, 0);
		repeat(8) { part_particles_create(global.ps_bottom, x + random_range(-8, 8), y + random_range(-8, 8), global.pt_blood_5, 1) };
		scr_effect_object(x, y, obj_ef_blood, spr_ef_blood_0, 0, 1);
		scr_effect_object(x + random_range(-6, 6), y + random_range(-6, 6), obj_ef_blood, spr_ef_blood_1, 0, 1);
		
		repeat(15){
			var spurt = instance_create(x + random_range(-5, 5), y + random_range(-8, 8), obj_ef_bloodspurt);
			spurt.dir = random(360);
		}
		
		repeat(6){
			var gore = instance_create(x, y, obj_ef_gore);
			gore.dir = random(360);
		}
	}
	
	if (object_index == obj_enemy_3){
		scr_sound_play(snd_object_metal_hit_0, false, 0.8, 1.2);
		scr_effect_object(other.x, other.y, obj_ef_blood, spr_ef_metal_0, 0, 1);
	}else{
		scr_sound_play(choose(snd_character_hit_0, snd_character_hit_1), false, 0.8, 1.2);
	}
}
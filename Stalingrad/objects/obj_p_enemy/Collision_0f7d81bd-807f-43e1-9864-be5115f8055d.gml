if (object_index == obj_enemy_1){
	if (owner != global.player) && (owner != noone){
		exit;
	}
}

if (object_index == obj_enemy_0) || (object_index == obj_enemy_2) || (object_index == obj_enemy_3){
	if (cutscene_prop){
		exit;
	}
}

if (i_time < 1) && (other.spd > 0) && (other.enemy == false){
	scr_bonuspoints_update(BonusPoints.WeaponThrow);
	scr_pawn_damage(clamp(other.damage - defense, 1, 6), other.spd / 10, other.dir, 7);
	
	if (object_index != obj_enemy_3){
		part_particles_create(global.ps_bottom, x, y + 6, global.pt_blood_1, 14);
		part_particles_create(global.ps_bottom, x, y + 6, global.pt_gore_0, 6);
		scr_effect_object(other.x, other.y, obj_ef_blood, spr_ef_blood_0, 0, 1);
		scr_effect_object(x + random_range(-6, 6), y + random_range(-6, 6), obj_ef_blood, spr_ef_blood_1, 0, 1);
		
		repeat(15){
			var spurt = instance_create(x + random_range(-5, 5), y + random_range(-8, 8), obj_ef_bloodspurt);
			spurt.dir = other.dir + random_range(-38, 38);
		}
	
		repeat(4){
			var gore = instance_create(x, y, obj_ef_gore);
			gore.dir = other.dir + random_range(-50, 50);
		}
	}
	
	scr_effect_screenshake(4);
	scr_effect_freeze(10);
	if (object_index == obj_enemy_3){
		scr_sound_play(snd_object_metal_hit_0, false, 0.8, 1.2);
		scr_effect_object(other.x, other.y, obj_ef_blood, spr_ef_metal_0, 0, 1);
	}else{
		scr_sound_play(choose(snd_character_hit_0, snd_character_hit_1), false, 0.8, 1.2);
	}
	
	whiteflash_alpha = 1;
	part_particles_create(global.ps_front, x, y + 6, global.pt_burst_2, 9);
    
	if (object_index != obj_enemy_1){
		with(other){
			instance_destroy();
			
			if (other.object_index != obj_enemy_3){
				part_type_direction(global.pt_blood_5, image_angle - 20, image_angle + 20, 0, 0);
				part_type_speed(global.pt_blood_5, 2.75, 3.75, -0.15, 0);
				repeat(8)part_particles_create(global.ps_bottom, x + random_range(-8, 8), y + random_range(-8, 8), global.pt_blood_5, 1);
			}
		}
	}
}
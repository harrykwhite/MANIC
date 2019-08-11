var inst = other;

with(owner){
	if (object_index == obj_enemy_1){
		if (self.owner != obj_player) && (self.owner != noone){
			return;
		}
	}

	if (cutscene_prop){
		return;
	}

	if (i_time < 1) && (inst.spd > 0) && (!inst.enemy){
		scr_bonuspoints_update(BonusPoints.WeaponThrow);
		scr_pawn_damage(max(inst.damage - defense, 1), inst.spd / 6, inst.dir, 7);
		
		scr_effect_screenshake(4);
		scr_effect_freeze(13);
		if (object_index == obj_enemy_3) || (object_index == obj_giantturret) || (object_index == obj_giantturret_flamethrower){
			scr_sound_play(snd_object_metal_hit_0, false, 0.8, 1.2);
			scr_effect_object(inst.x, inst.y, obj_ef_blood, spr_ef_metal_0, 0, 1);
		}else{
			scr_sound_play(choose(snd_character_hit_0, snd_character_hit_1), false, 0.8, 1.2);
		}
		
		burn = inst.burn && inst.canburn;
		whiteflash_alpha = 1;
		part_particles_create(global.ps_front, x, y + 4, global.pt_burst_2, 9);
		
		if (object_index != obj_enemy_3) && (object_index != obj_giantturret) && (object_index != obj_giantturret_flamethrower){
			part_particles_create(global.ps_bottom, x, y + 6, global.pt_blood_1, 14);
			part_particles_create(global.ps_bottom, x, y + 6, global.pt_gore_0, 6);
			scr_effect_object(inst.x, inst.y, obj_ef_blood, spr_ef_blood_0, 0, 1);
			scr_effect_object(x + random_range(-6, 6), y + random_range(-6, 6), obj_ef_blood, spr_ef_blood_1, 0, 1);
		
			repeat(15){
				var spurt = instance_create(x + random_range(-5, 5), y + random_range(-8, 8), obj_ef_bloodspurt);
				spurt.dir = inst.dir + random_range(-38, 38);
			}
	
			repeat(4){
				var gore = instance_create(x, y, obj_ef_gore);
				gore.dir = inst.dir + random_range(-50, 50);
			}
		
			if (object_index != obj_enemy_1){
				with(inst){
					instance_destroy();
					part_type_direction(global.pt_blood_5, image_angle - 20, image_angle + 20, 0, 0);
					part_type_speed(global.pt_blood_5, 2.75, 3.75, -0.15, 0);
					repeat(8)part_particles_create(global.ps_bottom, x + random_range(-8, 8), y + random_range(-8, 8), global.pt_blood_5, 1);
				}
			}
		}else{
			instance_destroy(inst);
		}
	}
}
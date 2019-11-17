if (global.cutscene_current != -1) || (global.game_pause){
	return;
}

var inst = other;
var mult = 1;

with(owner){
	if (pawn == PawnType.Enemy) && (!inst.damage_enemy){
		return;
	}

	if (pawn == PawnType.Companion) && (!inst.damage_companion){
		return;
	}

	if (object_index == obj_enemy_1){
		if (owner != obj_player) && (owner != noone){
			return;
		}
	}
	
	if (cutscene_prop){
		return;
	}

	if (i_time <= 0){
		scr_pawn_damage(max(inst.damage - defense, 1), inst.strength, random(360), 5);
		
		if (object_index == obj_enemy_2){
			if (bite_to){
				bite_to = false;
				bite_retreat = true;
				bite_retreat_direction = point_direction(x, y, inst.x, inst.y) - 180;
				bite_retreat_x = inst.x;
				bite_retreat_y = inst.y;
			}
		}
		
		if (object_index == obj_enemy_0) || (object_index == obj_enemy_2) ||  (object_index == obj_thedogkeeper_dog){
			if (inst.damage > 3){
				if (object_index == obj_enemy_0){
					if (type != Enemy0_Type.Mother) && (type != Enemy0_Type.Sniper) && (type != Enemy0_Type.TrainBoss){
						headless = true;
					}
				}else if (object_index == obj_enemy_2){
					headless = true;
				}
			}
		
			part_particles_create(global.ps_bottom, x, y + 6, global.pt_blood_1, 10 * mult);
			part_particles_create(global.ps_bottom, x, y + 6, global.pt_blood_3, 3 * mult);
		    part_particles_create(global.ps_bottom, x, y + 6, global.pt_gore_0, 3 * mult);
			part_type_direction(global.pt_blood_5, 0, 360, 0, 0);
			part_type_speed(global.pt_blood_5, 2.75, 3.75, -0.15, 0);
			repeat(8){ part_particles_create(global.ps_bottom, x + random_range(-8, 8), y + random_range(-8, 8), global.pt_blood_5, 1) };
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
	
		if (object_index == obj_enemy_3) || (object_index == obj_giantturret) || (object_index == obj_giantturret_flamethrower){
			scr_sound_play(snd_object_metal_hit_0, false, 0.8, 1.2);
			scr_effect_object(inst.x, inst.y, obj_ef_blood, spr_ef_metal_0, 0, 1);
		}else{
			scr_sound_play(choose(snd_character_hit_0, snd_character_hit_1), false, 0.8, 1.2);
		}
	}
}
if (global.cutscene_current != -1) || (global.game_pause){
	return;
}

var inst = other;
var mult = scr_get_blood_mult();

with(owner){
	if (object_index == obj_enemy_1){
		return;
	}
	
	if (cutscene_prop){
		return;
	}

	if (i_time <= 0) && (inst.bite_to){
		var dir = point_direction(inst.x, inst.y, x, y);
		scr_pawn_damage(max(inst.damage - defense, 1), inst.strength, dir, 2);
		
		if (object_index == obj_enemy_2){
			if (bite_to){
				bite_to = false;
				bite_retreat = true;
				bite_retreat_direction = point_direction(x, y, inst.x, inst.y) - 180;
				bite_retreat_x = inst.x;
				bite_retreat_y = inst.y;
			}
		}
		
		if (object_index != obj_enemy_1) && (object_index != obj_enemy_3) && (object_index != obj_giantturret) && (object_index != obj_giantturret_flamethrower){
			part_particles_create(global.ps_front, inst.x, inst.y, global.pt_blood_0, 3 * mult);
			part_particles_create(global.ps_bottom, x, y + 6, global.pt_blood_1, 10 * mult);
			part_particles_create(global.ps_bottom, x, y + 6, global.pt_blood_3, 3 * mult);
		    part_particles_create(global.ps_bottom, x, y + 6, global.pt_gore_0, 3 * mult);
			part_type_direction(global.pt_blood_5, dir - 20, dir + 20, 0, 0);
			part_type_speed(global.pt_blood_5, 2.75, 3.75, -0.15, 0);
			repeat(8){ part_particles_create(global.ps_bottom, inst.x + random_range(-8, 8), inst.y + random_range(-8, 8), global.pt_blood_5, 1) };
			scr_effect_object(inst.x, inst.y, obj_ef_blood, spr_ef_blood_0, 0, 1);
			scr_effect_object(inst.x + random_range(-6, 6), inst.y + random_range(-6, 6), obj_ef_blood, spr_ef_blood_1, 0, 1);
		
			repeat(13){
				var spurt = instance_create(x + random_range(-5, 5), y + random_range(-8, 8), obj_ef_bloodspurt);
				spurt.dir = dir + random_range(-38, 38);
			}
		
			repeat(3){
				var gore = instance_create(x, y, obj_ef_gore);
				gore.dir = dir + random_range(-20, 20);
			}
		}
		
		inst.bite_to = false;
		inst.bite_retreat = true;
		inst.bite_retreat_direction = point_direction(inst.x, inst.y, x, y + 6) - 180;
		inst.bite_retreat_x = x;
		inst.bite_retreat_y = y + 6;
		inst.bite_retreat_time = 0;
		
		if (object_index == obj_enemy_3) || (object_index == obj_giantturret) || (object_index == obj_giantturret_flamethrower){
			scr_sound_play(snd_object_metal_hit_0, false, 0.8, 1.2);
			scr_effect_object(inst.x, inst.y, obj_ef_blood, spr_ef_metal_0, 0, 1);
		}else{
			scr_sound_play(choose(snd_character_hit_0, snd_character_hit_1), false, 0.8, 1.2);
		}
	}
}
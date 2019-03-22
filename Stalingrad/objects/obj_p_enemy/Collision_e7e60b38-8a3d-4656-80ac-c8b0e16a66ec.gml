if (other.enemy){
	exit;
}

if (!other.damage){
	exit;
}

if (object_index == obj_enemy_1){
	if (owner != obj_player) && (owner != noone){
		exit;
	}
}

if (object_index == obj_enemy_0) || (object_index == obj_enemy_2) || (object_index == obj_enemy_3){
	if (cutscene_prop){
		exit;
	}
}

other.owner = id;
other.owner_offset_x = clamp(x - other.x, -7, 7);
other.owner_offset_y = clamp(y - other.y, -7, 7);

if (i_time <= 0){
	scr_pawn_damage(clamp(other.damage - defense, 1, 6), other.strength, other.dir, 3);
	
	if (object_index == obj_enemy_0) || (object_index == obj_enemy_2) ||  (object_index == obj_thedogkeeper_dog) || (object_index == obj_thescorched) || (object_index == obj_thedogkeeper){
		part_particles_create(global.ps_front, other.x, other.y, global.pt_blood_0, 3);
		part_particles_create(global.ps_bottom, x, y + 6, global.pt_blood_1, 10);
		part_particles_create(global.ps_bottom, x, y + 6, global.pt_blood_3, 3);
	    part_particles_create(global.ps_bottom, x, y + 6, global.pt_gore_0, 3);
		part_type_direction(global.pt_blood_5, other.dir - 20, other.dir + 20, 0, 0);
		part_type_speed(global.pt_blood_5, 2.75, 3.75, -0.15, 0);
		repeat(7) { part_particles_create(global.ps_bottom, other.x + random_range(-8, 8), other.y + random_range(-8, 8), global.pt_blood_5, 1) };
		scr_effect_object(other.x, other.y, obj_ef_blood, spr_ef_blood_0, 0, 1);
		scr_effect_object(other.x + random_range(-6, 6), other.y + random_range(-6, 6), obj_ef_blood, spr_ef_blood_1, 0, 1);
		bleed = true;
		
		repeat(13){
			var spurt = instance_create(x + random_range(-5, 5), y + random_range(-8, 8), obj_ef_bloodspurt);
			spurt.dir = other.dir + random_range(-38, 38);
		}
		
		repeat(2){
			var gore = instance_create(x, y, obj_ef_gore);
			gore.dir = other.dir + random_range(-20, 20);
		}
	}
	
	if (object_index == obj_enemy_3) || (object_index == obj_giantturret) || (object_index == obj_giantturret_flamethrower){
		scr_sound_play(snd_object_metal_hit_0, false, 0.8, 1.2);
		scr_effect_object(other.x, other.y, obj_ef_blood, spr_ef_metal_0, 0, 1);
	}else{
		scr_sound_play(choose(snd_character_hit_0, snd_character_hit_1), false, 0.8, 1.2);
	}
}
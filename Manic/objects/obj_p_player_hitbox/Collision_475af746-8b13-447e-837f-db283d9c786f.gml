if (global.cutscene_current != -1) || (global.game_pause){
	return;
}

var inst = other;

with(owner){
	if (object_index != obj_player){
		if (!inst.damage_companion){
			return;
		}
	}else{
		if (state == scr_player_dash){
			return;
		}
	}

	if (i_time < 1) && (inst.damage_player){
		if (object_index == obj_player){
			scr_player_damage(round(inst.damage * 0.5), inst.strength, random(360), 40);
		}else{
			scr_pawn_damage(round(inst.damage * 0.5), inst.strength, random(360), 40);
		}
	
	    scr_effect_screenshake(4);
	    part_particles_create(global.ps_front, x, y, global.pt_blood_0, 6);
	    part_particles_create(global.ps_bottom, x, y + 6, global.pt_blood_1, 10);
		part_particles_create(global.ps_bottom, x, y + 6, global.pt_blood_3, 3);
	    part_particles_create(global.ps_bottom, x, y + 6, global.pt_gore_0, 3);
	    scr_effect_object(inst.x, inst.y, obj_ef_blood, spr_ef_blood_0, 0, 1);
	    scr_effect_object(x + random_range(-6, 6), y + random_range(-6, 6), obj_ef_blood, spr_ef_blood_1, 0, 1)
		scr_sound_play(choose(snd_character_hit_0, snd_character_hit_1), false, 0.8, 1.2);
	
		repeat(15){
			var spurt = instance_create(x + random_range(-3, 3), y + random_range(-6, 6), obj_ef_bloodspurt);
			spurt.dir = random(360);
		}
	
		repeat(3){
			var gore = instance_create(x, y, obj_ef_gore);
			gore.dir = random(360);
		}
	
		part_type_direction(global.pt_blood_5, 0, 360, 0, 0);
		part_type_speed(global.pt_blood_5, 3, 5, -0.2, 0);
		repeat(20)part_particles_create(global.ps_bottom, x + random_range(-8, 8), y + random_range(-8, 8), global.pt_blood_5, 1);
	}
}
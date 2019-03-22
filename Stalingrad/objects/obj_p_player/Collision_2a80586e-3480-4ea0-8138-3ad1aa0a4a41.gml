if (i_time < 1) && (other.leash_bite){
	var dir = point_direction(other.x, other.y, x, y);
	
	if (object_index == obj_player){
		scr_player_damage(other.damage, other.strength, dir, 50);
	}else{
		scr_pawn_damage(other.damage, other.strength, dir, 60);
	}
	
    scr_effect_screenshake(2);
    scr_effect_freeze(20);
    part_particles_create(global.ps_front, x, y, global.pt_blood_0, 6);
    part_particles_create(global.ps_bottom, x, y + 6, global.pt_blood_1, 10);
	part_particles_create(global.ps_bottom, x, y + 6, global.pt_blood_3, 3);
    part_particles_create(global.ps_bottom, x, y + 6, global.pt_gore_0, 3);
    scr_effect_object(other.x, other.y, obj_ef_blood, spr_ef_blood_0, 0, 1);
    scr_effect_object(x + random_range(-6, 6), y + random_range(-6, 6), obj_ef_blood, spr_ef_blood_1, 0, 1)
	scr_sound_play(choose(snd_character_hit_0, snd_character_hit_1), false, 0.8, 1.2);
	
	repeat(13){
		var spurt = instance_create(x + random_range(-5, 5), y + random_range(-8, 8), obj_ef_bloodspurt);
		spurt.dir = dir + random_range(-38, 38);
	}
	
	repeat(3){
		var gore = instance_create(x, y, obj_ef_gore);
		gore.dir = dir;
	}
	
	part_type_direction(global.pt_blood_5, dir - 30, dir + 30, 0, 0);
	part_type_speed(global.pt_blood_5, 3, 5, -0.2, 0);
	repeat(20)part_particles_create(global.ps_bottom, x + random_range(-8, 8), y + random_range(-8, 8), global.pt_blood_5, 1);
	
	with(other){
		leash_bite = false;
		leash_bite_retreat = true;
	}
}

event_inherited();
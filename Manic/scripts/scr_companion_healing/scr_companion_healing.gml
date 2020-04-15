if (health_current < health_max){
	if (heal_time > 0){
		heal_time --;
	}else{
		health_current ++;
		health_current = clamp(health_current, 0, health_max);
		health_scale = 1.5;
		
		scr_sound_play(snd_object_health_pickup_0, false, 0.8, 1.2);
		
		repeat(5){
			part_particles_create(global.ps_bottom, x + random_range(-4, 4), y + random_range(-4, 4), global.pt_wood_1, 1);
		}
		
		part_type_direction(global.pt_heal_0, 0, 360, 0, 0);
		
		repeat(11){
			part_particles_create(global.ps_front, x + random_range(-6, 6), y + random_range(-6, 6), global.pt_heal_0, 1);
		}
		
		heal_time = heal_time_max;
	}
}else{
	heal_time = heal_time_max;
}
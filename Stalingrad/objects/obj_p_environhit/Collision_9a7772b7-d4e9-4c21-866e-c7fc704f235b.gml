if (hit_time <= 0){
	flash = 0.8;
	
	spd = 0.5;
	dir = other.dir;
	
	hit -= other.damage * 2;
	hit_time = 3;
	
	part_type_direction(global.pt_wood_1, (other.dir - 180) - 30, (other.dir - 180) + 30, 0, 0);
	repeat(7) part_particles_create(global.ps_bottom, x + random_range(-8, 8), y + random_range(-8, 8), global.pt_wood_1, 2);
	scr_sound_play(snd_object_box_hit_0, false, 0.8, 1.2);
}

instance_destroy(other);
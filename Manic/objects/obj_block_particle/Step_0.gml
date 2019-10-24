// Spawning Particles
if (spawn){
	repeat(number){
		var xx = x + random_range(-offset, offset);
		var yy = y + random_range(-offset, offset);

		part_particles_create(global.ps_bottom, xx, yy, part, 1);
	}
	
	spawn = false;
}
if (other.object_index != obj_p_environhit) && (object_get_parent(other.object_index) != obj_p_environhit){
	repeat(5){
		part_particles_create(global.ps_front, x + random_range(-6, 6), y + random_range(-6, 6), global.pt_fire_0, 1);
	}
	
	repeat(4){
		part_particles_create(global.ps_front, x + random_range(-6, 6), y + random_range(-6, 6), global.pt_fire_2, 1);
	}
	
	instance_destroy();
}
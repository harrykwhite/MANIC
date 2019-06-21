if (other.object_index != obj_p_environhit) && (object_get_parent(other.object_index) != obj_p_environhit){
	part_particles_create(global.ps_front, x + random_range(-4, 4), y + random_range(-4, 4), global.pt_fire_0, 2);
	part_particles_create(global.ps_front, x + random_range(-4, 4), y + random_range(-4, 4), global.pt_fire_2, 2);
	instance_destroy();
}
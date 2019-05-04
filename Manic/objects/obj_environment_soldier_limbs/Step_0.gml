if (start) && (parent == -1){
	part_particles_create(global.ps_bottom, x, y + 8, global.pt_blood_1_perm, 7);
	part_particles_create(global.ps_bottom, x, y + 8, global.pt_gore_0_perm, 3);
	start = false;
}

if (parent != -1) && (onscreen(x, y)){
	depth_offset = 32;
	
	if (!instance_exists(parent)){
		x = x + random_range(-3, 3);
		y = y + random_range(-2, 2);
		
		depth_offset = 0;
		parent = -1;
	}
}
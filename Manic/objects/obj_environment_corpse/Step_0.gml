if (start){
	repeat(16){
		part_particles_create(global.ps_bottom, x + random_range(-23, 15), y + 6, global.pt_blood_1_perm, 1);
	}
	
	repeat(7){
		part_particles_create(global.ps_bottom, x + random_range(-23, 15), y + 6, global.pt_blood_3_perm, 1);
	}
	
	repeat(12){
		part_particles_create(global.ps_bottom, x + random_range(-23, 15), y + 6, global.pt_gore_0_perm, 1);
	}
	
	start = false;
}

if (parent != -1){
	depth_offset = 45;
	
	if (!instance_exists(parent)){
		x = x + random_range(-3, 3);
		y = y + random_range(-2, 2);
		
		depth_offset = 0;
		parent = -1;
	}
}
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

scr_object_table_place(25, 1.35);
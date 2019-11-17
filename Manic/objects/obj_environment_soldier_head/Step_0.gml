if (start) && (parent == -1){
	part_particles_create(global.ps_bottom, x, y + 8, global.pt_blood_1_perm, 7);
	part_particles_create(global.ps_bottom, x, y + 8, global.pt_gore_0_perm, 3);
	start = false;
}

scr_object_table_place(25, 1.185);
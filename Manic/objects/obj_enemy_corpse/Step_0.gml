if (global.game_pause){
	return;
}

scr_object_table_place(30, 1.275);

if (parent == -1){
	// Blood
	if (spd > 0.01) || (time > 0){
		if (random(2) < 1){
			part_particles_create(global.ps_bottom, x + random_range(-15, 15), y + 18, global.pt_blood_1_perm, 1);
			part_particles_create(global.ps_bottom, x + random_range(-15, 15), y + 18, global.pt_gore_0_perm, 1);
		}
		
		if (random(4) < 1){
			part_particles_create(global.ps_bottom, x + random_range(-15, 15), y + 18, global.pt_blood_3_perm, 1);
		}
		
		time --;
	}

	// Motion
	spd *= 0.9;
	spd = max(spd, 0);

	if (move){
		if (!place_meeting(x + lengthdir_x(spd, dir), y + lengthdir_y(spd, dir), obj_p_solid)){
			x += lengthdir_x(spd, dir);
			y += lengthdir_y(spd, dir);
		}else{
			spd = 0;
		}
	}
}
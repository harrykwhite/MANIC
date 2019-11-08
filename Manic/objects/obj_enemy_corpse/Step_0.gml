if (global.game_pause){
	return;
}

scr_object_table_place(47, 2.5);

// Blood
if (spd > 0.1){
	if (random(3) < 1){
		part_particles_create(global.ps_bottom, x + random_range(-15, 15), y + 18, global.pt_blood_1_perm, 1);
		part_particles_create(global.ps_bottom, x + random_range(-15, 15), y + 18, global.pt_gore_0_perm, 1);
	}
	
	if (random(6) < 1){
		part_particles_create(global.ps_bottom, x + random_range(-15, 15), y + 18, global.pt_blood_3_perm, 1);
	}
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
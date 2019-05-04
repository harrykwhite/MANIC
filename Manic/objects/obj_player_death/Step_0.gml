if (global.cutscene_current != -1) || (global.game_pause){
	return;
}

// Blood
if (spd > 0.1){
	if (random(3) < 1){
		part_particles_create(global.ps_bottom, x + random_range(-15, 15), y + 18, global.pt_blood_1, 1);
		part_particles_create(global.ps_bottom, x + random_range(-15, 15), y + 18, global.pt_gore_0, 1);
	}
	
	if (random(6) < 1){
		part_particles_create(global.ps_bottom, x + random_range(-15, 15), y + 18, global.pt_blood_3, 1);
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

// Light
if (light > 0){
	if (light_time < 10){
		light_time ++;
	}else{
		light_time = 0;
		light -= 0.2;
	}
}else{
	light = 0;
}
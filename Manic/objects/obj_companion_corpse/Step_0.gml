if (global.game_pause){
	return;
}

// Blood
if (spd > 0.1){
	if (random(3) < 1){
		part_particles_create(global.ps_bottom, x + random_range(-15, 15) + (6 * image_xscale), y + 21, global.pt_blood_1, 1);
		part_particles_create(global.ps_bottom, x + random_range(-15, 15) + (6 * image_xscale), y + 21, global.pt_gore_0, 1);
	}
	
	if (random(6) < 1){
		part_particles_create(global.ps_bottom, x + random_range(-15, 15) + (6 * image_xscale), y + 21, global.pt_blood_3, 1);
	}
}

// Cutscene
if (time_end_cutscene < 60 * 1.3){
	time_end_cutscene ++;
}else{
	if (in_cutscene){
		if (global.cutscene_current == 40){
			global.cutscene_current = -1;
			
			if (instance_exists(obj_player)){
				obj_player.move_x_to = -1;
				obj_player.move_y_to = -1;
			}
		}
		
		in_cutscene = false;
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
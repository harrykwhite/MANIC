if ((global.cutscene_current != -1) && (global.cutscene_current != 39)) || (global.game_pause){
	exit;
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

// Cutscene
if (time_end_cutscene < 60 * 1.3){
	time_end_cutscene++;
}else{
	global.cutscene_current = -1;
	global.player_companion = -1;
	
	if (instance_exists(global.player)){
		global.player.move_xTo = -1;
		global.player.move_yTo = -1;
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
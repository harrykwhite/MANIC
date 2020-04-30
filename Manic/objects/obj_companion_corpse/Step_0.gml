if (scr_player_has_companion(type)){
	image_alpha = 0;
	instance_destroy();
	return;
}

if (global.game_pause){
	return;
}

// Flicker
if (doflicker){
	if (flicker_time > 0){
		flicker_time --;
	}else{
		flicker = !flicker;
		flicker_time = flicker_time_max;
	}
	
	image_alpha = flicker ? 0.7 : 1;
}

// Blood
if (spd > 0.01 && type != obj_companion_0){
	if (random(2) < 1){
		part_particles_create(global.ps_bottom, x + random_range(-15, 15) + (6 * image_xscale), y + 21, global.pt_blood_1, 1);
		part_particles_create(global.ps_bottom, x + random_range(-15, 15) + (6 * image_xscale), y + 21, global.pt_gore_0, 1);
	}
	
	if (random(4) < 1){
		part_particles_create(global.ps_bottom, x + random_range(-15, 15) + (6 * image_xscale), y + 21, global.pt_blood_3, 1);
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
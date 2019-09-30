if (global.game_pause){
	return;
}

if (!place_meeting(x + (3 * sign(dcos(dir))), y + 8 + (3 * sign(dsin(dir))), obj_p_solid)){
	instance_destroy();
}

if (place_meeting(x, y + 8, obj_conveyerbelt_0)){
	var inst = instance_place(x, y + 8, obj_conveyerbelt_0);
	spd = inst.spd;
	dir = inst.dir;
}

if (spd > 0){
	x += lengthdir_x(spd, dir);
	y += lengthdir_y(spd, dir);
	
	if (dtime <= 0){
		if (place_meeting(x + lengthdir_x(spd * 2, dir), y + 4 + lengthdir_y(spd * 2, dir), obj_conveyerbelt_1)){
			instance_destroy();
		}
	
		if (place_meeting(x + lengthdir_x(spd * 2, dir), y + 4 + lengthdir_y(spd * 2, dir), obj_conveyerbelt_2)){
			instance_destroy();
		}
	
		if (place_meeting(x + lengthdir_x(spd * 2, dir), y + 4 + lengthdir_y(spd * 2, dir), obj_conveyerbelt_3)){
			instance_destroy();
		}
		
		if (place_meeting(x + lengthdir_x(spd * 2, dir), y + 4 + lengthdir_y(spd * 2, dir), obj_conveyerbelt_4)){
			instance_destroy();
		}
	}else{
		dtime --;
	}
}
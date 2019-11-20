if (global.game_pause){
	return;
}

if (place_meeting(x, y + 8, obj_conveyerbelt_0)){
	var inst = instance_place(x, y + 8, obj_conveyerbelt_0);
	spd = inst.spd;
	dir = inst.dir;
	parent = inst;
}else{
	parent = instance_place(x, y + 8, parent_backup);
	
	if (spd > 0.01){
		spd *= 0.6;
	}else{
		spd = 0;
	}
}

scr_object_table_place(25 + depth_real_offset, 1.4);

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
// Flash
flash -= 0.15;
flash = clamp(flash, 0, 1);

// Hit Control
if (hit <= 0){
	death = true;
}

if (hit_time > 0){
	hit_time--;
}

// Motion
if (spd > 0.375){
	var col_list, col_length, can_move;
	col_list[0] = obj_p_enemy;
	col_list[1] = obj_p_player;
	col_length = array_length_1d(col_list);
	can_move = true;
	
	for(var i = 0; i < col_length; i ++){
		if (place_meeting(x + lengthdir_x(spd + 1, dir), y + lengthdir_y(spd, dir), col_list[i])){
			can_move = false;
			break;
		}
	}
	
	if (can_move){
		x += lengthdir_x(spd, dir);
		y += lengthdir_y(spd, dir);
	}
	
	spd *= 0.9;
}else{
	if (point_distance(x, y, xstart, ystart) > 1){
		var dirto = point_direction(x, y, xstart, ystart);
		x += lengthdir_x(abs(xstart - x) * 0.1, dirto);
		y += lengthdir_y(abs(ystart - y) * 0.1, dirto);
	}
}

// Object Death
if (death){
	scr_sound_play(snd_object_box_break_0, false, 0.8, 1.2);
    instance_destroy();
    scr_effect_screenshake(3);
	scr_effect_freeze(8);
	scr_weapon_ammo_spawn(6, 8, 4);
	scr_effect_vignette_flash(c_ltgray, 0.2, 0.01);
	part_type_direction(global.pt_wood_2, 0, 360, 0, 0);
    repeat(15)part_particles_create(global.ps_front, x + random_range(-7, 7), y + random_range(-5, 5), global.pt_wood_2, 1);
	var brk = instance_create(x, y, obj_break); brk.shake = 3; brk.sprite_index = spr_ammo_crate_break;
}

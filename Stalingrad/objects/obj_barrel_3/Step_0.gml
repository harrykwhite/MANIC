// Flash
flash -= 0.15;
flash = clamp(flash, 0, 1);

// Hit Control
if (hit <= 0){
	explode = true;
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
	if (point_distance(x, y, basex, basey) > 1){
		var dirto = point_direction(x, y, basex, basey);
		x += lengthdir_x(abs(basex - x) * 0.1, dirto);
		y += lengthdir_y(abs(basey - y) * 0.1, dirto);
	}
}

// Explode
if (explode){
	if (scale < 1.3){
		scale += 0.025;
	}else{
		death = true;
	}
	
	image_xscale = scale;
	image_yscale = scale;
}

// Object Death
if (death){
    instance_destroy();
	scr_damage_custom(3, 1, 45, 45, 3, true, true, true, true);
    scr_damage_custom_toxic(50, 50, 140, true);
    scr_effect_screenshake(3);
	scr_effect_freeze(5);
	scr_effect_vignette_flash(c_ltgray, 0.3, 0.01);
	scr_sound_play_distance(snd_object_box_break_0, false, 500);
	var brk = instance_create(x, y, obj_break); brk.shake = 4; brk.sprite_index = spr_barrel_0_break;
}
if (global.game_pause){
	return;
}

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
	if (!place_meeting(x + lengthdir_x(spd + 3, dir), y + lengthdir_y(spd + 3, dir), obj_p_pawn)){
		x += lengthdir_x(spd, dir);
		y += lengthdir_y(spd, dir);
	}
	
	spd *= 0.9;
}else{
	if (point_distance(x, y, basex, basey) >= 1){
		var dirto = point_direction(x, y, basex, basey);
		if (!place_meeting(x + lengthdir_x(3, dirto), y + lengthdir_y(3, dirto), obj_p_pawn)){
			x += lengthdir_x(abs(basex - x) * 0.1, dirto);
			y += lengthdir_y(abs(basey - y) * 0.1, dirto);
		}
	}else{
		x = basex;
		y = basey;
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
	scr_explode_effects(60, 10, true, true, true);
	instance_destroy();
	
	var brk = instance_create(x, y, obj_break);
	brk.shake = 4;
	brk.sprite_index = spr_barrel_0_break;
}


if (global.game_pause){
	image_speed = 0;
	return;
}

if (fire){
	sprite_index = spr_chair_destroyed_0;
	image_speed = 1;
	
	if (random(9) < 1){
		part_particles_create(global.ps_front, x + random_range(-3, 3), y - 3, global.pt_smoke_3, 1);
	}
}

// Flash
flash -= 0.15;
flash = clamp(flash, 0, 1);

// Motion
if (spd > 0.375){
	if (!place_meeting(x + lengthdir_x(spd + 3, dir), y + lengthdir_y(spd + 3, dir), obj_p_pawn)){
		x += lengthdir_x(spd, dir);
		y += lengthdir_y(spd, dir);
	}
	
	spd *= 0.925;
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

// Hit Control
if (hit <= 0){
	death = true;
}

if (hit_time > 0){
	hit_time--;
}

// Object Death
if (death){
	if (death_effects){
		scr_env_destroy(spr_chair_0_break);
	}else{
		var brk = instance_create(x, y, obj_break);
		brk.sprite_index = spr_chair_0_break;
		brk.shake = 0;
		instance_destroy();
	}
}
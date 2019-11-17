if (global.game_pause){
	image_speed = 0;
	return;
}

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
	if (!place_meeting(x + lengthdir_x(spd + 3, dir), y + lengthdir_y(spd + 3, dir), obj_p_pawn)){
		x += lengthdir_x(spd, dir);
		y += lengthdir_y(spd, dir);
	}
	
	spd *= 0.9;
}else{
	if (point_distance(x, y, basex, basey) >= 1){
		var dirto = point_direction(x, y, basex, basey);
		if (!place_meeting(x + lengthdir_x(3, dirto), y + lengthdir_y(3, dirto), obj_p_pawn)){
			x += lengthdir_x(abs(basex - x) * 0.3, dirto);
			y += lengthdir_y(abs(basey - y) * 0.3, dirto);
		}
	}else{
		x = basex;
		y = basey;
	}
}

// Object Death
if (death){
	var reached = true;
	
	if (image_xscale < 1.15){
		image_xscale += 0.05;
		reached = false;
	}
	
	if (image_yscale < 1.15){
		image_yscale += 0.05;
		reached = false;
	}
	
	if (reached){
		scr_env_destroy(spr_computer_desk_0_remains);
		
		repeat(17){
			part_particles_create(global.ps_front, x + random_range(-12, 12), y + random_range(-6, 6), global.pt_fire_1, 1);
		}
		
		if (room == rm_level_1_01){
			var levelobj = scr_level_get_object();
			levelobj.factory_explode = true;
		}
	}
}
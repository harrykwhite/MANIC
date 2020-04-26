if (global.game_pause){
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
			x += lengthdir_x(abs(basex - x) * 0.1, dirto);
			y += lengthdir_y(abs(basey - y) * 0.1, dirto);
		}
	}else{
		x = basex;
		y = basey;
	}
}

// Object Death
if (death){
	var amount = 7;
	
	if (global.boss_current != -1){
		amount *= 2;
	}
	
	scr_env_destroy(spr_ammo_crate_break);
	scr_weapon_ammo_spawn(amount, 8, 4);
	
	if (room == rm_prologue_00){
		with(obj_controller_ui){
			if (tutourial){
				if (tutourial_stage == TutourialStage.CollectAmmo){
					tutourial_stage_ammocollected_done = true;
					
					if ((tutourial_stage_timer == -1) || (tutourial_stage_timer > 60 * 2)){
						tutourial_stage_timer = 60 * 2;
					}
				}
			}
		}
	}
}
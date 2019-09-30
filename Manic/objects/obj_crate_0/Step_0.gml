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
	scr_env_destroy(spr_crate_0_break);
	
	scr_weapon_ammo_spawn(4, 6, 5, x, y + 6);
	
	if (room == rm_prologue_00){
		with(obj_controller_ui){
			if (tutourial){
				if (tutourial_stage == TutourialStage.CollectAmmo){
					tutourial_stage_ammocollected_done = true;
					
					if (tutourial_stage_timer == -1){
						tutourial_stage_timer = 60 * 2;
					}
				}
			}
		}
	}
	
	if (random(4) < 1){
		instance_create(x, y + 8, obj_health_pack_0);
	}

	if (global.level_current >= Level.UndergroundBunker){
		if (random(9) < 1){
			var weapon = instance_create(x, y + 6, obj_weapondrop);
			weapon.index = PlayerWeapon.Grenade;
			
			if (global.level_current >= Level.HumanPrison){
				weapon.index = choose(PlayerWeapon.Grenade, PlayerWeapon.Grenade, PlayerWeapon.ReinforcedGrenade);
			}
			
			if (global.level_current >= Level.TrainStation){
				weapon.index = choose(PlayerWeapon.Grenade, PlayerWeapon.ReinforcedGrenade, PlayerWeapon.LandMine);
			}
			
			weapon.angle = random_range(-10, 10);
			weapon.pack = true;
			weapon.quantity = random_range(2, 3);
		}
	}
}
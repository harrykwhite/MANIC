if (global.game_pause){
	image_speed = 0;
	return;
}

image_speed = 1;

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
	
	spd *= 0.8;
}else{
	if (point_distance(x, y, basex, basey) >= 1){
		var dirto = point_direction(x, y, basex, basey);
		if (!place_meeting(x + lengthdir_x(3, dirto), y + lengthdir_y(3, dirto), obj_p_pawn)){
			x += lengthdir_x(abs(basex - x) * 0.35, dirto);
			y += lengthdir_y(abs(basey - y) * 0.35, dirto);
		}
	}else{
		x = basex;
		y = basey;
	}
}

// Object Death
var effects = true;

if ((id == inst_3EBC3DA6) && (global.game_productionengine_destroyed0))
|| ((id == inst_13B89224) && (global.game_productionengine_destroyed1))
|| ((id == inst_6C8F37DD) && (global.game_productionengine_destroyed2))
|| ((id == inst_441089D2) && (global.game_productionengine_destroyed3))
|| ((id == inst_3B48AB62) && (global.game_productionengine_destroyed4)){
	death = true;
	effects = false;
}

if (death){
	var reached = true;
	
	if (effects){
		if (image_xscale < 1.15){
			image_xscale += 0.05;
			reached = false;
		}
		
		if (image_yscale < 1.15){
			image_yscale += 0.05;
			reached = false;
		}
		
		if (!reached){
			return;
		}
		
		scr_env_destroy(spr_conveyerbelt_4_break);
		scr_explode_effects(60, 10, true, true, true);
	}else{
		var brk = instance_create(x, y, obj_break);
		brk.shake = 0;
		brk.sprite_index = spr_conveyerbelt_4_break;
		
		instance_destroy();
		return;
	}
	
	// Save
	var belts = ds_list_create(), beltcount = 0, beltshutdownsound = true;
	
	switch(id){
		case inst_3EBC3DA6:
			global.game_productionengine_destroyed0 = true;
			beltshutdownsound = false;
			break;
		
		case inst_13B89224:
			global.game_productionengine_destroyed1 = true;
			beltcount = collision_rectangle_list(592, 508, 838, 638, obj_conveyerbelt_0, false, true, belts, false);
			
			if (instance_exists(inst_65B5D1CE)){
				inst_65B5D1CE.stop = true;
			}
			
			if (instance_exists(inst_588810D1)){
				instance_destroy(inst_588810D1);
			}
			break;
		
		case inst_6C8F37DD:
			global.game_productionengine_destroyed2 = true;
			beltcount = collision_rectangle_list(1304, 718, 1460, 846, obj_conveyerbelt_0, false, true, belts, false);
			
			if (instance_exists(inst_413A3BF0)){
				instance_destroy(inst_413A3BF0);
			}
			break;
		
		case inst_441089D2:
			global.game_productionengine_destroyed3 = true;
			beltcount = collision_rectangle_list(1322, 436, 1460, 484, obj_conveyerbelt_0, false, true, belts, false);
			
			if (instance_exists(inst_6E43FE90)){
				instance_destroy(inst_6E43FE90);
			}
			break;
		
		case inst_3B48AB62:
			global.game_productionengine_destroyed4 = true;
			beltcount = collision_rectangle_list(1276, 24, 1450, 160, obj_conveyerbelt_0, false, true, belts, false);
			
			if (instance_exists(inst_19AF309C)){
				instance_destroy(inst_19AF309C);
			}
			break;
	}
	
	var cblock = instance_place(x + (sprite_width / 2), y + (sprite_height / 2), obj_block_cutscene);
	if (cblock != noone){
		instance_destroy(cblock);
	}
	
	if (beltshutdownsound){
		scr_sound_play(snd_other_conveyerbelt_1, false, 1, 1);
	}
	
	if (beltcount > 0){
		for(var i = 0; i < beltcount; i ++){
			belts[| i].stop = true;
		}
	}
	
	ds_list_destroy(belts);
	
	// Objective update
	if (effects){
		if (global.game_objective_current == Objectives.DestroyProductionEngines){
			scr_objective_update_counter();
		}
	}
	
	instance_destroy();
}
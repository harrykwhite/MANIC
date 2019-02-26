var levelobj = scr_get_level_object();

if (special == "levelfourboss"){
	if (global.game_objective_current != 3) || (levelobj.dogkeeper_failed) || (global.boss_current != -1){
		exit;
	}
}

if (special == "levelfourbossrestart"){
	if (global.boss_current != -1) || (global.game_objective_current != 3) || (!levelobj.dogkeeper_failed){
		exit;
	}
}

if (instance_exists(global.player)) && (global.cutscene_current == -1) && (active){	
	/*if ((global.level_current == 0) || (global.level_current == 2) || (global.level_current == 3) || (global.level_current == 4) || (global.level_current == 6) || (global.level_current == 7) || (global.level_current == 8)) && (global.game_objective_current == 0){
		if (index != 33) && (index != 34) && (index != 35) && (index != 36) && (index != 38) && (index != 6) && (index != 40) && (index != 41) && (index != 42) && (index != 43) && (index != 44) && (index != 45) && (index != 46){
			exit;
		}
	}*/
	
	if (global.level_current == 1){
		if (global.boss_current != -1) && (index == 51){
			exit;
		}
	}
	
	if (global.level_current == 3) && (room == rm_level_4_01){
		if (special != "levelfourboss") && (special != "levelfourbossrestart"){
			if (global.game_objective_current < 4){
				exit;
			}                                                          
		}
	}
	
	if (global.level_current == 4) && (room == rm_level_5_03){
		if (global.game_objective_current != 3){
			exit;
		}                                                          
	}
	
	if (global.level_current == 5) && (room == rm_level_6_01){
		if (levelobj.objective_type[global.game_objective_current] != ObjectiveType.Clear) && (index != 26){
			exit;
		}
	}else{
		if (global.level_current == 5) && (instance_exists(obj_pawn_other_train_1)){
			if (global.game_objective_current != 3) || (obj_pawn_other_train_1.spd > 0.1) exit;
		}else if (global.level_current == 5){
			if (index != 38){
				exit;
			}
		}
	}
	
	if (place_meeting(x + 1, y + 1, global.player)){
		if (time >= 30){
			global.cutscene_current = index;
			
			if (index == 52){
				obj_controller_gameplay.cutscene_moveto_dir = moveto_dir;
				obj_controller_gameplay.cutscene_moveto_room = moveto_room;
				obj_controller_gameplay.cutscene_moveto_level = moveto_level;
				obj_controller_gameplay.cutscene_moveto_type = moveto_type;
			}
			
			if (special == "levelfourboss"){
				var number, inst;
				instance_activate_object(obj_block_cutscene);
				scr_enemy_destroy_all();
				
				number = instance_number(obj_block_cutscene);
				for(var i = 0; i < number; i++){
					inst = instance_find(obj_block_cutscene, i);
					
					if (instance_exists(inst)){
						if (inst.special == "levelfourboss"){
							instance_destroy(inst);
						}
					}
				}
			}
			
			if (destroy_on_active){
				if (!respawnOnDeath){
					instance_destroy();
				}else{
					active = false;
				}
			}
		}
	}else{
		time ++;
	}
}else{
	if (global.cutscene_current == -1){
		if (special == "levelfourboss"){
			levelobj.dogkeeper_failed = true;
			instance_destroy();
		}
	}
}
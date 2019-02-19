var levelobj = scr_get_level_object();

if (special == "levelfourboss"){
	if (global.game_objective_current != 3){
		exit;
	}
}

if (special == "levelfourbossrestart"){
	if (global.game_objective_current != 3) || (!levelobj.dogkeeper_failed){
		exit;
	}
}

if (instance_exists(global.player)) && (global.cutscene_current == -1) && (active){	
	if ((global.level_current == 0) || (global.level_current == 2) || (global.level_current == 3) || (global.level_current == 4) || (global.level_current == 6) || (global.level_current == 7) || (global.level_current == 8)) && (global.game_objective_current == 0){
		if (index != 33) && (index != 34) && (index != 35) && (index != 36) && (index != 38) && (index != 6) && (index != 40) && (index != 41) && (index != 42) && (index != 43) && (index != 44) && (index != 45) && (index != 46){
			exit;
		}
	}
	
	if (global.level_current == 1){
		if (global.game_objective_current != 2) && (index == 19){
			exit;
		}
		if (global.boss_current != -1) && (index == 21){
			exit;
		}
	}
	
	if (global.level_current == 3) && (room == rm_level_4_01){
		if (global.game_objective_current != 3) && (global.game_objective_current != 4){
			exit;
		}                                                          
	}
	
	if (global.level_current == 4) && (room == rm_level_5_03){
		if (global.game_objective_current != 3){
			exit;
		}                                                          
	}
	
	if (global.level_current == 5) && (room == rm_level_6_01){
		if (global.game_objective_current != 1) && (index != 26){
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
			
			if (special == "levelfourboss"){
				var number, inst;
				instance_activate_object(obj_block_cutscene);
				scr_enemy_destroy_all();
				levelobj.dogkeeper = instance_create(872, 530, obj_thedogkeeper);
				
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
			
			if (destroyOnActive){
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
}
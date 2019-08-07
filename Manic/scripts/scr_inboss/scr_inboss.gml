if (global.boss_current != -1){
	return true;
}

if (instance_exists(obj_enemy_0)){
	var count = instance_number(obj_enemy_0);
	var inst;
	
	for(var i = 0; i < count; i ++){
		inst = instance_find(obj_enemy_0, i);
		
		if (inst.type == Enemy0_Type.Mother){
			global.boss_current = Boss.MotherRobot;
			return true;
		}
		
		if (inst.type == Enemy0_Type.Sniper){
			if (!inst.cutscene_prop){
				global.boss_current = Boss.SniperRobot;
				return true;
			}
		}
		
		if (inst.type == Enemy0_Type.TrainBoss){
			global.boss_current = Boss.TrainBoss;
			return true;
		}
	}
}

if (instance_exists(obj_thescorched)){
	if (!obj_thescorched.cutscene_prop){
		global.boss_current = Boss.TheScorched;
		return true;
	}
}

if (instance_exists(obj_thedogkeeper)){
	if (!obj_thedogkeeper.cutscene_prop){
		global.boss_current = Boss.TheDogkeeper;
		return true;
	}
}

if (instance_exists(obj_pawn_other_train_1)){
	if (obj_pawn_other_train_1.is_boss){
		global.boss_current = Boss.TrainBoss;
		return true;
	}
}

if (instance_exists(obj_giantturret)){
	if (obj_giantturret.active){
		global.boss_current = Boss.GiantTurret;
		return true;
	}
}

if (instance_exists(obj_antagonist)){
	if (obj_antagonist.active) && (!obj_antagonist.near_dead) && (!obj_antagonist.walk_off){
		global.boss_current = Boss.Antagonist;
		return true;
	}
}

if (global.cutscene_current == 40){
	if (obj_controller_gameplay.cutscene_look_boss != -1){
		global.boss_current = obj_controller_gameplay.cutscene_look_boss;
		return true;
	}
}

if (global.cutscene_current == 46){
	global.boss_current = Boss.TheDogkeeper;
	return true;
}

return false;
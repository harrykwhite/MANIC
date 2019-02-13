if (global.cutscene_current == 11){
	global.boss_current = Boss.TheScorched;
	return true;
	exit;
}

if (instance_exists(obj_enemy_0)){
	var count = instance_number(obj_enemy_0);
	var inst;
	
	for(var i = 0; i < count; i ++){
		inst = instance_find(obj_enemy_0, i);
		
		if (inst.type == EnemyOneType.Mother){
			global.boss_current = Boss.MotherRobot;
			return true;
			exit;
		}
		
		if (inst.type == EnemyOneType.Sniper){
			if (!inst.sniper_cutscene_prop){
				global.boss_current = Boss.SniperRobot;
				return true;
				exit;
			}
		}
		
		if (inst.type == EnemyOneType.SniperBoss){
			global.boss_current = Boss.SniperRobotBoss;
			return true;
			exit;
		}
	}
}

if (instance_exists(obj_thescorched)){
	if (!obj_thescorched.cutscene_prop){
		global.boss_current = Boss.TheScorched;
		return true;
		exit;
	}
}

if (instance_exists(obj_thedogkeeper)){
	if (!obj_thedogkeeper.cutscene_prop){
		global.boss_current = Boss.TheDogkeeper;
		return true;
		exit;
	}
}

global.boss_current = -1;
return false;
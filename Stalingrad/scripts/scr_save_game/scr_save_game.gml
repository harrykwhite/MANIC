ini_open("save.ini");

if (global.level_current > global.game_save_level){
	global.game_save_level = global.level_current;
	ini_write_real("Save", "LevelAt", global.game_save_level);
}

ini_write_real("Save", "Started", global.game_save_started);
ini_write_real("Save", "Seconds", global.game_save_seconds);

ini_write_real("Save", "TheScorchedKilled", global.game_boss_thescorched_killed);
ini_write_real("Save", "TheDogkeeperKilled", global.game_boss_thedogkeeper_killed);
ini_write_real("Save", "TrainHordeKilled", global.game_boss_trainhorde_killed);
ini_write_real("Save", "FinalBossKilled", global.game_boss_final_killed);
ini_write_real("Save", "FirstDogKilled", global.game_firstdog_killed);
ini_write_real("Save", "FirstGrenadierKilled", global.game_firstgrenadier_killed);
ini_write_real("Save", "FirstCrazyKilled", global.game_firstcrazy_killed);
ini_write_real("Save", "FirstSniperKilled", global.game_firstsniper_killed);
ini_write_real("Save", "FirstHealerKilled", global.game_firsthealer_killed);
ini_write_real("Save", "FirstFlyHeadKilled", global.game_firstflyhead_killed);
ini_write_real("Save", "FirstTurretKilled", global.game_firstturret_killed);
ini_write_real("Save", "CompanionFarmerFound", global.game_companion_farmer_found);
ini_write_real("Save", "CompanionGrenadierFound", global.game_companion_grenadier_found);
ini_write_real("Save", "CompanionPrisonerFound", global.game_companion_prisoner_found);
ini_write_real("Save", "CompanionDogFound", global.game_companion_dog_found);

if (ds_exists(global.player_upgrades, ds_type_list)){
	var upgradecount = array_length_1d(global.upgrade_name);
	for(var i = 0; i < upgradecount; i ++){
		var unlocked = scr_player_has_upgrade(i);
		
		global.game_save_upgrade_unlocked[i] = unlocked;
		ini_write_real("Save", "Upgrade" + string(i), unlocked);
	}
}

if (ds_exists(global.player_companions, ds_type_grid)){
	var companioncount = ds_grid_height(global.player_companions);
	for(var i = 0; i < companioncount; i ++){
		ini_write_real("Save", "Companion" + string(i), global.player_companions[# 0, i]);
		ini_write_real("Save", "Companion" + string(i) + "_Health", global.player_companions[# 1, i]);
	}
}

ini_close();
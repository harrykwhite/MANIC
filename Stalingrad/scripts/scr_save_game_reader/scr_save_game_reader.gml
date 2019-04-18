ini_open(working_directory + "save.ini");
global.game_save_started = ini_read_real("Save", "Started", false);
global.game_save_level = ini_read_real("Save", "LevelAt", 0);
global.game_save_seconds = ini_read_real("Save", "Seconds", 0);

global.game_boss_thescorched_killed = ini_read_real("Save", "TheScorchedKilled", false);
global.game_boss_thedogkeeper_killed = ini_read_real("Save", "TheDogkeeperKilled", false);
global.game_boss_trainhorde_killed = ini_read_real("Save", "TrainHordeKilled", false);
global.game_boss_final_killed = ini_read_real("Save", "FinalBossKilled", false);
global.game_firstdog_killed = ini_read_real("Save", "FirstDogKilled", false);
global.game_firstgrenadier_killed = ini_read_real("Save", "FirstGrenadierKilled", false);
global.game_firstcrazy_killed = ini_read_real("Save", "FirstCrazyKilled", false);
global.game_firstsniper_killed = ini_read_real("Save", "FirstSniperKilled", false);
global.game_firsthealer_killed = ini_read_real("Save", "FirstHealerKilled", false);
global.game_firstflyhead_killed = ini_read_real("Save", "FirstFlyHeadKilled", false);
global.game_firstturret_killed = ini_read_real("Save", "FirstTurretKilled", false);
global.game_firstmaggot_killed = ini_read_real("Save", "FirstMaggotKilled", false);
global.game_companion_farmer_found = ini_read_real("Save", "CompanionFarmerFound", false);
global.game_companion_grenadier_found = ini_read_real("Save", "CompanionGrenadierFound", false);
global.game_companion_prisoner_found = ini_read_real("Save", "CompanionPrisonerFound", false);
global.game_companion_dog_found = ini_read_real("Save", "CompanionDogFound", false);

var upgradecount = array_length_1d(global.upgrade_name);
for(var i = 0; i < upgradecount; i ++){
	global.game_save_upgrade_unlocked[i] = ini_read_real("Save", "Upgrade" + string(i), false);
}

var levelcount = array_length_1d(global.level_name);
for(var i = 0; i < levelcount; i ++){
	global.level_entered[i] = ini_read_real("Save", "Level_Entered" + string(i), false);
	global.level_kill_count[i] = ini_read_real("Save", "Level_KillCount" + string(i), 0);
	global.level_cleared[i] = ini_read_real("Save", "Level_Cleared" + string(i), false);
}

var collectcount = ds_grid_height(global.level_collectable_found);
for(var i = 0; i < collectcount; i ++){
	global.level_collectable_found[# 0, i] = ini_read_real("Save", "CollectableFound" + string(i), false);
}

var turretcount = ds_grid_height(global.level_turret_killed);
for(var i = 0; i < turretcount; i ++){
	global.level_turret_killed[# 0, i] = ini_read_real("Save", "TurretKilled" + string(i), false);
}

if (ds_exists(global.player_companions, ds_type_grid)){
	var companioncount = ds_grid_height(global.player_companions);
	for(var i = 0; i < companioncount; i ++){
		global.player_companions[# 0, i] = ini_read_real("Save", "Companion" + string(i), -1);
		global.player_companions[# 1, i] = ini_read_real("Save", "Companion" + string(i) + "_Health", -1);
	}
}

ini_close();
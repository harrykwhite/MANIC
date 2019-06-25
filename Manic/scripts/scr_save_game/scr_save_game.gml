ini_open(working_directory + "save.ini");

if (global.level_current > global.game_save_level){
	global.game_save_level = global.level_current;
	ini_write_real("Save", "LevelAt", global.game_save_level);
}

global.game_save_level_atpreroom = (room == global.level_preroom[global.game_save_level]);
ini_write_real("Save", "LevelAtPreRoom", global.game_save_level_atpreroom);

ini_write_real("Save", "Started", global.game_save_started);
ini_write_real("Save", "Seconds", global.game_save_seconds);

ini_write_real("Save", "WorldTrainRoom", global.worldtrain_room);
ini_write_real("Save", "TheScorchedKilled", global.game_boss_thescorched_killed);
ini_write_real("Save", "TheScorchedTalked", global.game_boss_thescorched_talked);
ini_write_real("Save", "TheDogkeeperKilled", global.game_boss_thedogkeeper_killed);
ini_write_real("Save", "TheDogkeeperTalked", global.game_boss_thedogkeeper_talked);
ini_write_real("Save", "FirstAntagKilled", global.game_boss_firstantag_killed);
ini_write_real("Save", "FirstAntagTalked", global.game_boss_firstantag_talked);
ini_write_real("Save", "TrainHordeKilled", global.game_boss_trainhorde_killed);
ini_write_real("Save", "TrainHordeTalked", global.game_boss_trainhorde_talked);
ini_write_real("Save", "FinalBossKilled", global.game_boss_final_killed);
ini_write_real("Save", "FirstEnemyKilled", global.game_firstenemy_killed);
ini_write_real("Save", "FirstDogKilled", global.game_firstdog_killed);
ini_write_real("Save", "FirstGrenadierKilled", global.game_firstgrenadier_killed);
ini_write_real("Save", "FirstCrazyKilled", global.game_firstcrazy_killed);
ini_write_real("Save", "FirstSniperKilled", global.game_firstsniper_killed);
ini_write_real("Save", "FirstHealerKilled", global.game_firsthealer_killed);
ini_write_real("Save", "FirstFlyHeadKilled", global.game_firstflyhead_killed);
ini_write_real("Save", "FirstTurretKilled", global.game_firstturret_killed);
ini_write_real("Save", "FirstMaggotKilled", global.game_firstmaggot_killed);
ini_write_real("Save", "CompanionFarmerFound", global.game_companion_farmer_found);
ini_write_real("Save", "CompanionFarmerLevel2PostTalked", global.game_companion_farmer_level2post_talked);
ini_write_real("Save", "CompanionGrenadierFound", global.game_companion_grenadier_found);
ini_write_real("Save", "CompanionPrisonerFound", global.game_companion_prisoner_found);
ini_write_real("Save", "CompanionDogFound", global.game_companion_dog_found);
ini_write_real("Save", "Prisoner0Left", global.game_npc_prisoner0_left);
ini_write_real("Save", "Prisoner1Left", global.game_npc_prisoner1_left);
ini_write_real("Save", "Prisoner2Left", global.game_npc_prisoner2_left);
ini_write_real("Save", "Prisoner3Left", global.game_npc_prisoner3_left);
ini_write_real("Save", "Prisoner4Left", global.game_npc_prisoner4_left);
ini_write_real("Save", "Prisoner5Left", global.game_npc_prisoner5_left);
ini_write_real("Save", "Prisoner6Left", global.game_npc_prisoner6_left);
ini_write_real("Save", "TownPerson0Talked", global.game_npc_townperson0_talked);
ini_write_real("Save", "TownPerson1Talked", global.game_npc_townperson1_talked);

var weaponcount = global.weapon_potential_slotmax;
for(var i = 0; i < weaponcount; i ++){
	ini_write_real("Save", "WeaponSlot" + string(i), global.weapon_slot[i]);
	ini_write_real("Save", "WeaponSlotAmmo" + string(i), global.weapon_slotammo[i]);
	
	var dodefault = true;
	
	if (global.weapon_slot[i] != -1){
		if (global.weapon_type[global.weapon_slot[i]] == WeaponType.Throwing){
			ini_write_real("Save", "WeaponSlotQuantity" + string(i), global.weapon_quantity[global.weapon_slot[i]]);
			dodefault = false;
		}
	}
	
	if (dodefault){
		ini_write_real("Save", "WeaponSlotQuantity" + string(i), 0);
	}
}

var upgradecount = array_length_1d(global.upgrade_name);
for(var i = 0; i < upgradecount; i ++){
	var unlocked = scr_player_has_upgrade(i);
	
	global.game_save_upgrade_unlocked[i] = unlocked;
	ini_write_real("Save", "Upgrade" + string(i), unlocked);
}

var levelcount = array_length_1d(global.level_name);
for(var i = 0; i < levelcount; i ++){
	ini_write_real("Save", "Level_Entered" + string(i), global.level_entered[i]);
	ini_write_real("Save", "Level_KillCount" + string(i), global.level_kill_count[i]);
	ini_write_real("Save", "Level_Cleared" + string(i), global.level_cleared[i]);
}

var collectcount = ds_grid_height(global.level_collectable_found);
for(var i = 0; i < collectcount; i ++){
	ini_write_real("Save", "CollectableFound" + string(i), global.level_collectable_found[# 0, i]);
}

var turretcount = ds_grid_height(global.level_turret_killed);
for(var i = 0; i < turretcount; i ++){
	ini_write_real("Save", "TurretKilled" + string(i), global.level_turret_killed[# 0, i]);
}

if (ds_exists(global.player_companions, ds_type_grid)){
	var companioncount = ds_grid_height(global.player_companions);
	for(var i = 0; i < companioncount; i ++){
		ini_write_real("Save", "Companion" + string(i), real(global.player_companions[# 0, i]));
		ini_write_real("Save", "Companion" + string(i) + "_Health", global.player_companions[# 1, i]);
	}
}

ini_close();
if (!global.game_save_started){
	return;
}

ini_open(working_directory + "save.ini");

if (global.level_current >= global.game_save_level){
	global.game_save_level = global.level_current;
	ini_write_real("Save", "LevelAt", global.game_save_level);
}

global.game_save_level_atpreroom = (room == global.level_preroom[global.game_save_level]);
ini_write_real("Save", "LevelAtPreRoom", global.game_save_level_atpreroom);

ini_write_real("Save", "Started", global.game_save_started);
ini_write_real("Save", "Seconds", global.game_save_seconds);

ini_write_real("Save", "ObjectiveCurrent", global.game_objective_current);
ini_write_real("Save", "ObjectiveSet", global.game_objective_set);
ini_write_real("Save", "ObjectiveCounter", global.objective_counter[global.game_objective_current]);
ini_write_real("Save", "ObjectiveCounterMax", global.objective_counter_max[global.game_objective_current]);

ini_write_real("Save", "PlayerHealth", global.player_health_current);

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
ini_write_real("Save", "CompanionFarmerLevel2PostTalked0", global.game_companion_farmer_level2post_talked_0);
ini_write_real("Save", "CompanionFarmerLevel2PostTalked1", global.game_companion_farmer_level2post_talked_1);
ini_write_real("Save", "CompanionFarmerLevel4PreTalked0", global.game_companion_farmer_level4pre_talked_0);
ini_write_real("Save", "CompanionGrenadierFound", global.game_companion_grenadier_found);
ini_write_real("Save", "CompanionPrisonerFound", global.game_companion_prisoner_found);
ini_write_real("Save", "CompanionDogFound", global.game_companion_dog_found);
ini_write_real("Save", "ProductionRoomDestroyed0", global.game_productionengine_destroyed0);
ini_write_real("Save", "ProductionRoomDestroyed1", global.game_productionengine_destroyed1);
ini_write_real("Save", "ProductionRoomDestroyed2", global.game_productionengine_destroyed2);
ini_write_real("Save", "ProductionRoomDestroyed3", global.game_productionengine_destroyed3);
ini_write_real("Save", "ProductionRoomDestroyed4", global.game_productionengine_destroyed4);
ini_write_real("Save", "Prisoner0Left", global.game_npc_prisoner0_left);
ini_write_real("Save", "Prisoner1Left", global.game_npc_prisoner1_left);
ini_write_real("Save", "Prisoner2Left", global.game_npc_prisoner2_left);
ini_write_real("Save", "Prisoner3Left", global.game_npc_prisoner3_left);
ini_write_real("Save", "Prisoner4Left", global.game_npc_prisoner4_left);
ini_write_real("Save", "Prisoner5Left", global.game_npc_prisoner5_left);
ini_write_real("Save", "Prisoner6Left", global.game_npc_prisoner6_left);
ini_write_real("Save", "Prisoner7Left", global.game_npc_prisoner7_left);
ini_write_real("Save", "Prisoner8Left", global.game_npc_prisoner8_left);
ini_write_real("Save", "HordeChallenge0Completed", global.game_hordechallenge0_completed);
ini_write_real("Save", "HordeChallenge1Completed", global.game_hordechallenge1_completed);
ini_write_real("Save", "HordeChallenge2Completed", global.game_hordechallenge2_completed);
ini_write_real("Save", "TownPerson0Talked", global.game_npc_townperson0_talked);
ini_write_real("Save", "TownPerson1Talked", global.game_npc_townperson1_talked);
ini_write_real("Save", "TownPerson2Talked", global.game_npc_townperson2_talked);
ini_write_real("Save", "TownPerson3Talked", global.game_npc_townperson3_talked);
ini_write_real("Save", "TownPerson4Talked", global.game_npc_townperson4_talked);
ini_write_real("Save", "TownPerson5Talked", global.game_npc_townperson5_talked);
ini_write_real("Save", "TownPerson6Talked", global.game_npc_townperson6_talked);
ini_write_real("Save", "PlayerWifeTalked", global.game_npc_player_wife_talked);
ini_write_real("Save", "ConveyerBeltShutdown0", global.game_conveyerbelt_shutdown0);
ini_write_real("Save", "ConveyerBeltShutdown1", global.game_conveyerbelt_shutdown1);
ini_write_real("Save", "ConveyerBeltShutdown2", global.game_conveyerbelt_shutdown2);
ini_write_real("Save", "ConveyerBeltShutdown3", global.game_conveyerbelt_shutdown3);

var weaponcount = global.weapon_potential_slotmax;

ini_write_real("Save", "WeaponDefault", global.weapon_default);

for(var i = 0; i < weaponcount; i ++){
	ini_write_real("Save", "WeaponSlot" + string(i), global.weapon_slot[i]);
	ini_write_real("Save", "WeaponSlotAmmo" + string(i), global.weapon_slotammo[i]);
	ini_write_real("Save", "WeaponSlotQuantity" + string(i), global.weapon_slotquantity[i]);
}

var upgradecount = array_length_1d(global.upgrade_name);
for(var i = 0; i < upgradecount; i ++){
	var unlocked = scr_player_has_upgrade(i);
	
	global.game_save_upgrade_unlocked[i] = unlocked;
	ini_write_real("Save", "Upgrade" + string(i), unlocked);
}

var levelcount = array_length_1d(global.level_name);
for(var i = 0; i < levelcount; i ++){
	ini_write_real("Save", "LevelEntered" + string(i), global.level_entered[i]);
	ini_write_real("Save", "LevelComplete" + string(i), global.level_complete[i]);
	ini_write_real("Save", "LevelCollectableCurrent" + string(i), global.level_collectable_current[i]);
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
		ini_write_real("Save", "Companion" + string(i) + "Health", global.player_companions[# 1, i]);
	}
}

ini_close();
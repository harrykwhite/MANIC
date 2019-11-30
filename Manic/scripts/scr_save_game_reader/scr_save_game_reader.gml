ini_open(working_directory + "save.ini");
global.game_save_started = ini_read_real("Save", "Started", false);
global.game_save_level = ini_read_real("Save", "LevelAt", 0);
global.game_save_level_atpreroom = ini_read_real("Save", "LevelAtPreRoom", true);
global.game_save_seconds = ini_read_real("Save", "Seconds", 0);

global.game_objective_current = ini_read_real("Save", "ObjectiveCurrent", 0);
global.game_objective_set = ini_read_real("Save", "ObjectiveSet", false);
global.objective_counter[global.game_objective_current] = ini_read_real("Save", "ObjectiveCounter", 0);
global.objective_counter_max[global.game_objective_current] = ini_read_real("Save", "ObjectiveCounterMax", 0);

global.player_health_current = ini_read_real("Save", "PlayerHealth", 6);

global.worldtrain_room = ini_read_real("Save", "WorldTrainRoom", rm_level_6_00);

global.game_boss_thescorched_killed = ini_read_real("Save", "TheScorchedKilled", false);
global.game_boss_thescorched_talked = ini_read_real("Save", "TheScorchedTalked", false);
global.game_boss_thedogkeeper_killed = ini_read_real("Save", "TheDogkeeperKilled", false);
global.game_boss_thedogkeeper_talked = ini_read_real("Save", "TheDogkeeperTalked", false);
global.game_boss_firstantag_killed = ini_read_real("Save", "FirstAntagKilled", false);
global.game_boss_firstantag_talked = ini_read_real("Save", "FirstAntagTalked", false);
global.game_boss_trainhorde_killed = ini_read_real("Save", "TrainHordeKilled", false);
global.game_boss_trainhorde_talked = ini_read_real("Save", "TrainHordeTalked", false);
global.game_boss_final_killed = ini_read_real("Save", "FinalBossKilled", false);
global.game_firstenemy_killed = ini_read_real("Save", "FirstEnemyKilled", false);
global.game_firstdog_killed = ini_read_real("Save", "FirstDogKilled", false);
global.game_firstgrenadier_killed = ini_read_real("Save", "FirstGrenadierKilled", false);
global.game_firstcrazy_killed = ini_read_real("Save", "FirstCrazyKilled", false);
global.game_firstsniper_killed = ini_read_real("Save", "FirstSniperKilled", false);
global.game_firsthealer_killed = ini_read_real("Save", "FirstHealerKilled", false);
global.game_firstflyhead_killed = ini_read_real("Save", "FirstFlyHeadKilled", false);
global.game_firstturret_killed = ini_read_real("Save", "FirstTurretKilled", false);
global.game_firstmaggot_killed = ini_read_real("Save", "FirstMaggotKilled", false);
global.game_companion_farmer_found = ini_read_real("Save", "CompanionFarmerFound", false);
global.game_companion_farmer_level2post_talked_0 = ini_read_real("Save", "CompanionFarmerLevel2PostTalked0", false);
global.game_companion_farmer_level2post_talked_1 = ini_read_real("Save", "CompanionFarmerLevel2PostTalked1", false);
global.game_companion_farmer_level4pre_talked_0 = ini_read_real("Save", "CompanionFarmerLevel4PreTalked0", false);
global.game_companion_grenadier_found = ini_read_real("Save", "CompanionGrenadierFound", false);
global.game_companion_prisoner_found = ini_read_real("Save", "CompanionPrisonerFound", false);
global.game_companion_dog_found = ini_read_real("Save", "CompanionDogFound", false);
global.game_productionengine_destroyed0 = ini_read_real("Save", "ProductionRoomDestroyed0", false);
global.game_productionengine_destroyed1 = ini_read_real("Save", "ProductionRoomDestroyed1", false);
global.game_productionengine_destroyed2 = ini_read_real("Save", "ProductionRoomDestroyed2", false);
global.game_productionengine_destroyed3 = ini_read_real("Save", "ProductionRoomDestroyed3", false);
global.game_productionengine_destroyed4 = ini_read_real("Save", "ProductionRoomDestroyed4", false);
global.game_npc_prisoner0_left = ini_read_real("Save", "Prisoner0Left", false);
global.game_npc_prisoner1_left = ini_read_real("Save", "Prisoner1Left", false);
global.game_npc_prisoner2_left = ini_read_real("Save", "Prisoner2Left", false);
global.game_npc_prisoner3_left = ini_read_real("Save", "Prisoner3Left", false);
global.game_npc_prisoner4_left = ini_read_real("Save", "Prisoner4Left", false);
global.game_npc_prisoner5_left = ini_read_real("Save", "Prisoner5Left", false);
global.game_npc_prisoner6_left = ini_read_real("Save", "Prisoner6Left", false);
global.game_npc_prisoner7_left = ini_read_real("Save", "Prisoner7Left", false);
global.game_npc_prisoner8_left = ini_read_real("Save", "Prisoner8Left", false);
global.game_hordechallenge0_completed = ini_read_real("Save", "HordeChallenge0Completed", false);
global.game_hordechallenge1_completed = ini_read_real("Save", "HordeChallenge1Completed", false);
global.game_hordechallenge2_completed = ini_read_real("Save", "HordeChallenge2Completed", false);
global.game_npc_townperson0_talked = ini_read_real("Save", "TownPerson0Talked", false);
global.game_npc_townperson1_talked = ini_read_real("Save", "TownPerson1Talked", false);
global.game_npc_townperson2_talked = ini_read_real("Save", "TownPerson2Talked", false);
global.game_npc_townperson3_talked = ini_read_real("Save", "TownPerson3Talked", false);
global.game_npc_townperson4_talked = ini_read_real("Save", "TownPerson4Talked", false);
global.game_npc_townperson5_talked = ini_read_real("Save", "TownPerson5Talked", false);
global.game_npc_townperson6_talked = ini_read_real("Save", "TownPerson6Talked", false);
global.game_npc_player_wife_talked = ini_read_real("Save", "PlayerWifeTalked", false);
global.game_conveyerbelt_shutdown0 = ini_read_real("Save", "ConveyerBeltShutdown0", false);
global.game_conveyerbelt_shutdown1 = ini_read_real("Save", "ConveyerBeltShutdown1", false);
global.game_conveyerbelt_shutdown2 = ini_read_real("Save", "ConveyerBeltShutdown2", false);
global.game_conveyerbelt_shutdown3 = ini_read_real("Save", "ConveyerBeltShutdown3", false);

var weaponcount = global.weapon_potential_slotmax;

global.weapon_default = ini_read_real("Save", "WeaponDefault", PlayerWeapon.Revolver);

for(var i = 0; i < weaponcount; i ++){
	if (i == 0){
		global.weapon_slot[i] = ini_read_real("Save", "WeaponSlot" + string(i), PlayerWeapon.Revolver);
		global.weapon_slotammo[i] = ini_read_real("Save", "WeaponSlotAmmo" + string(i), global.weapon_ammomax[PlayerWeapon.Revolver]);
		global.weapon_slotquantity[i] = ini_read_real("Save", "WeaponSlotQuantity" + string(i), -1);
	}else{
		global.weapon_slot[i] = ini_read_real("Save", "WeaponSlot" + string(i), -1);
		global.weapon_slotammo[i] = ini_read_real("Save", "WeaponSlotAmmo" + string(i), -1);
		global.weapon_slotquantity[i] = ini_read_real("Save", "WeaponSlotQuantity" + string(i), -1);
	}
}

scr_player_upgrades_clear();

var upgradecount = array_length_1d(global.upgrade_name);
for(var i = 0; i < upgradecount; i ++){
	global.game_save_upgrade_unlocked[i] = ini_read_real("Save", "Upgrade" + string(i), false);
}

var levelcount = array_length_1d(global.level_name);
for(var i = 0; i < levelcount; i ++){
	global.level_entered[i] = ini_read_real("Save", "LevelEntered" + string(i), false);
	global.level_complete[i] = ini_read_real("Save", "LevelComplete" + string(i), false);
	global.level_collectable_current[i] = ini_read_real("Save", "LevelCollectableCurrent" + string(i), false);
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
		global.player_companions[# 1, i] = ini_read_real("Save", "Companion" + string(i) + "Health", -1);
	}
}

ini_close();
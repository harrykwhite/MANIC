global.worldtrain_room = rm_level_6_00;

global.game_boss_thescorched_killed = false;
global.game_boss_thescorched_talked = false;
global.game_boss_thedogkeeper_killed = false;
global.game_boss_thedogkeeper_talked = false;
global.game_boss_firstantag_killed = false;
global.game_boss_firstantag_talked = false;
global.game_boss_trainhorde_killed = false;
global.game_boss_trainhorde_talked = false;
global.game_boss_final_killed = false;
global.game_firstdog_killed = false;
global.game_firstgrenadier_killed = false;
global.game_firstcrazy_killed = false;
global.game_firstsniper_killed = false;
global.game_firsthealer_killed = false;
global.game_firstflyhead_killed = false;
global.game_firstturret_killed = false;
global.game_firstmaggot_killed = false;
global.game_companion_farmer_found = false;
global.game_companion_farmer_level2post_talked_0 = false;
global.game_companion_farmer_level2post_talked_1 = false;
global.game_companion_farmer_level4pre_talked_0 = false;
global.game_companion_farmer_level4post_talked_0 = false;
global.game_companion_grenadier_found = false;
global.game_companion_prisoner_found = false;
global.game_companion_dog_found = false;
global.game_productionengine_destroyed0 = false;
global.game_productionengine_destroyed1 = false;
global.game_productionengine_destroyed2 = false;
global.game_productionengine_destroyed3 = false;
global.game_productionengine_destroyed4 = false;
global.game_npc_prisoner0_left = false;
global.game_npc_prisoner1_left = false;
global.game_npc_prisoner2_left = false;
global.game_npc_prisoner3_left = false;
global.game_npc_prisoner4_left = false;
global.game_npc_prisoner5_left = false;
global.game_npc_prisoner6_left = false;
global.game_npc_prisoner7_left = false;
global.game_npc_prisoner8_left = false;
global.game_hordechallenge0_completed = false;
global.game_hordechallenge1_completed = false;
global.game_hordechallenge2_completed = false;
global.game_npc_townperson0_talked = false;
global.game_npc_townperson1_talked = false;
global.game_npc_townperson2_talked = false;
global.game_npc_townperson3_talked = false;
global.game_npc_townperson4_talked = false;
global.game_npc_townperson5_talked = false;
global.game_npc_townperson6_talked = false;
global.game_npc_player_wife_talked = false;
global.game_conveyerbelt_shutdown0 = false;
global.game_conveyerbelt_shutdown1 = false;
global.game_conveyerbelt_shutdown2 = false;
global.game_conveyerbelt_shutdown3 = false;

global.player_health_current = global.player_health_max;

if (ds_exists(global.level_collectable_found, ds_type_grid)){
	ds_grid_clear(global.level_collectable_found, false);
}

scr_checkpoint_reset();
scr_level_turret_reset();
scr_weapon_list();
scr_level_list();
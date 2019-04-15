scr_bonuspoints_list();
scr_weapon_list();
scr_pawn_list();
scr_cutscene_list();
scr_collectable_list();

global.game_pause = false;

global.game_combat_state = CombatState.Idle;
global.game_combat_active = true;
global.game_combat_state_time_real = 0;

global.game_level_opening_type = 0;

global.game_boss_thescorched_killed = false;
global.game_boss_thedogkeeper_killed = false;
global.game_boss_trainhorde_killed = false;
global.game_boss_final_killed = false;
global.game_firstdog_killed = false;
global.game_firstgrenadier_killed = false;
global.game_firstcrazy_killed = false;
global.game_firstsniper_killed = false;
global.game_firsthealer_killed = false;
global.game_firstflyhead_killed = false;
global.game_firstturret_killed = false;
global.game_companion_farmer_found = false;
global.game_companion_grenadier_found = false;
global.game_companion_prisoner_found = false;
global.game_companion_dog_found = false;

global.boss_current = -1;

if (room == rm_ini){
	scr_upgrade_list();
	scr_level_list();
	
	global.game_time_passed = 0;
	global.level_current = LevelIndex.RavagedTown;
	
	global.player_companions = ds_grid_create(2, 4);
	ds_grid_clear(global.player_companions, -1);
	
	var levelcount = array_length_1d(global.level_name);
	var size = 0;
	for(var i = 0; i < levelcount; i ++){
		size += global.level_collectable_number[i];
	}
	
	global.game_is_playthrough = true;
	global.level_collectable_found = ds_grid_create(1, size);
}

global.fade_object_group[0, 0] = noone;

global.game_score = 0;
global.game_score_bonus = 0;
global.game_score_deaths = 4000;
global.game_score_collectables = 0;
global.game_score_wpnvariation = 0;

global.player_respawn_x = 0;
global.player_respawn_y = 0;
global.player_health_max = 12;
global.player_health_current = global.player_health_max;
global.player_has_bossrespawn = false;
global.player_is_respawning = false;

global.worldtrain_room = rm_level_6_00;

var rslotcount = array_length_1d(global.weapon_slot);
for(var i = 0; i < rslotcount; i ++){
	global.sectionstart_weapon[i] = global.weapon_slot[i];
	
	if (global.weapon_slot[i] != -1){
		global.sectionstart_weaponammo[i] = global.weapon_ammomax[global.weapon_slot[i]];
	}else{
		global.sectionstart_weaponammo[i] = -1;
	}
}

global.sectionstart_playerhealth = 0;

part_system_clear(global.ps_bottom);
part_system_clear(global.ps_front);

randomize();
scr_weapon_list();
scr_pawn_list();
scr_cutscene_list();
scr_collectable_list();
scr_objective_list();

global.game_pause = false;
global.game_pause_nextframe = false;
global.game_in_dialogue = false;

global.game_combat_state = CombatState.Idle;
global.game_combat_state_time_real = 0;

global.game_combat_in_hordechallenge = false;
global.game_combat_in_hordechallenge_time = 0;

global.game_combat_arena_wave = 0;
global.game_combat_arena_wavemax = 9;

global.game_combat_playerskill = 1;

global.game_level_opening_type = 0;

global.boss_current = -1;

if (room == rm_ini){
	scr_upgrade_list();
	scr_level_list();
	scr_checkpoint_reset();
	
	global.game_save_started = false;
	global.game_save_seconds = 0;
	global.game_save_level = Level.RavagedTown;
	
	global.game_time_passed = 0;
	global.level_current = Level.Prologue;
	
	global.player_companions = ds_grid_create(2, 4);
	ds_grid_clear(global.player_companions, -1);
	
	var levelcount = global.level_campaign_count;
	
	var collectsize = 0;
	for(var i = 0; i < levelcount; i ++){
		collectsize += global.level_collectable_number[i];
	}
	
	global.level_collectable_found = ds_grid_create(1, collectsize + 1);
	ds_grid_clear(global.level_collectable_found, false);
	
	var turretsize = 0;
	
	for(var i = 0; i < levelcount; i ++){
		turretsize += global.level_turret_number[i];
	}
	
	global.level_turret_killed = ds_grid_create(1, turretsize);
	
	global.game_is_playthrough = true;
}

global.fade_object_group[0, 0] = noone;

global.player_respawn_x = 0;
global.player_respawn_y = 0;
global.player_health_max = 12;
global.player_health_current = global.player_health_max;
global.player_health_previous = global.player_health_max;
global.player_position_x = 0;
global.player_position_y = 0;
global.player_is_respawning = false;

part_system_clear(global.ps_bottom);
part_system_clear(global.ps_front);
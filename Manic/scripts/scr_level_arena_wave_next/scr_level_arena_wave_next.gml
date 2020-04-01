obj_controller_ui.arena_scale = 1.25;
scr_level_arena_wave_weaponspawn();
scr_level_arena_wave_healthspawn();

if (global.game_combat_arena_wave < global.game_combat_arena_wavemax){
	global.game_combat_arena_wave ++;
}
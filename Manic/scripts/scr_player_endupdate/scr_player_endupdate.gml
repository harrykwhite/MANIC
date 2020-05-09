var flylength = array_length_1d(fly);

if (global.player_health_current <= 0) && (!near_dead){
    scr_effect_blackbar();
    scr_effect_flash_script(0.01, 1, c_black, scr_trigger_0);
	audio_play_sound(m_combat_stinger_3, 3, false);
    
	scr_cutscene_block_restart_all();
	
	if (global.game_combat_in_hordechallenge){
		global.game_combat_in_hordechallenge = false;
		global.game_combat_in_hordechallenge_time = 0;
		global.game_combat_state = CombatState.Idle;
		
		var level = scr_level_get_object();
		with(level){
			audio_sound_gain(spawn_music_main[CombatState.Idle], 0, 0);
			audio_sound_gain(spawn_music_main[CombatState.Idle], 1 * obj_controller_all.real_music_volume, 2000);
			audio_sound_gain(spawn_music_main[CombatState.Buildup], 0, 2000);
			audio_sound_gain(spawn_music_main[CombatState.Climax], 0, 2000);
		
			audio_sound_gain(global.boss_music[0], 0, 2000);
			audio_play_sound(global.boss_stinger[0], 3, false);
		}
	}
	
	global.player_is_respawning = true;
	global.cutscene_current = -1;
	
	if (global.boss_current == Boss.TrainBoss) && (room == rm_level_6_00){
		scr_objective_change(Objectives.WaitForTrain, 0, 0);
	}
	
	for(var i = 0; i < flylength; i ++){
		if (instance_exists(fly[i])){
			instance_destroy(fly[i]);
			fly[i] = noone;
		}
	}
	
    instance_destroy();
}
// Changing Combat States
var bossmusic = noone;

if (global.boss_current != -1){
	bossmusic = global.boss_music[global.boss_current];
	
	if (bossmusic != noone){
		var setToGain = false;
		
		while (!audio_is_playing(bossmusic)){
			audio_play_sound(bossmusic, 3, true);
			audio_sound_gain(bossmusic, 0.02, 0);
			setToGain = true;
			
			obj_controller_ui.leveltext_alpha = 0;
			obj_controller_ui.leveltext_time = 60 * 3.5;
			obj_controller_ui.leveltext_other = true;
			obj_controller_ui.leveltext_text = string(global.boss_name[global.boss_current]);
			
			if (global.level_current != 9){
				audio_sound_gain(spawn_music_main[CombatState.Idle], 0, 7000);
				audio_sound_gain(spawn_music_main[CombatState.Buildup], 0, 7000);
				audio_sound_gain(spawn_music_main[CombatState.Climax], 0, 7000);
			}
		}
		
		while(audio_sound_get_gain(bossmusic) <= 0.01){
			audio_sound_gain(m_boss_main_0, 0.02, 0);
			setToGain = true;
		}
		
		if (setToGain){
			audio_sound_gain(bossmusic, 1, 4000);
		}
	}
}

if (audio_is_playing(m_boss_main_0)){
	if (audio_sound_get_gain(m_boss_main_0) <= 0.01){
		audio_stop_sound(m_boss_main_0);
	}
}

if (!global.game_pause) && (global.boss_current == -1) && (global.level_current != 9){
	switch(global.game_combat_state){
		case CombatState.Idle:
			if (spawn_state_time_real >= (60 * spawn_state_time[global.game_combat_state])){
				// Change the combat state to build up.
				spawn_state_time_real = 0;
				global.game_combat_state = CombatState.Buildup;
				spawn_time = 60 * spawn_interval[global.game_combat_state];
			
				// Play the stinger noise.
				var stinger = audio_play_sound(spawn_music_stinger[0], 3, false);
				audio_sound_gain(stinger, 0.7, 0);
			
				// Reset build up and climax music, lower Idle music.
				audio_sound_gain(spawn_music_main[CombatState.Idle], 0.7, 3000);
				audio_sound_gain(spawn_music_main[CombatState.Buildup], 1, 12000);
			}else{
				// Idle Music
				if (!audio_is_playing(spawn_music_main[CombatState.Idle])) || (audio_sound_get_gain(spawn_music_main[CombatState.Idle]) <= 0){
					audio_stop_sound(spawn_music_main[CombatState.Idle]);
					audio_play_sound(spawn_music_main[CombatState.Idle], 3, true);
					audio_sound_gain(spawn_music_main[CombatState.Idle], 0, 0);
					audio_sound_gain(spawn_music_main[CombatState.Idle], 1, 8000);
				}
				
				// Build - Up Music
				if (!audio_is_playing(spawn_music_main[CombatState.Buildup])){
					audio_play_sound(spawn_music_main[CombatState.Buildup], 3, true);
					audio_sound_gain(spawn_music_main[CombatState.Buildup], 0, 0);
				}
				
				// Climax Music
				if (!audio_is_playing(spawn_music_main[CombatState.Climax])){
					audio_play_sound(spawn_music_main[CombatState.Climax], 3, true);
					audio_sound_gain(spawn_music_main[CombatState.Climax], 0, 0);
				}
			}
		
			break;
	
		case CombatState.Buildup:
			if (spawn_state_time_real >= (60 * spawn_state_time[global.game_combat_state])){
				spawn_state_time_real = 0;
				global.game_combat_state = CombatState.Climax;
				spawn_time = 60 * spawn_interval[global.game_combat_state];
			
				var stinger = audio_play_sound(spawn_music_stinger[1], 3, false);
				audio_sound_gain(stinger, 0, 0);
				audio_sound_gain(stinger, 0.7, 1000);
			
				audio_sound_gain(spawn_music_main[CombatState.Idle], 0, 3000);
				audio_sound_gain(spawn_music_main[CombatState.Buildup], 0.7, 3000);
				audio_sound_gain(spawn_music_main[CombatState.Climax], 1, 4000);
			}
		
			break;
	
		case CombatState.Climax:
			if (spawn_state_time_real >= (60 * spawn_state_time[global.game_combat_state])){
				spawn_state_time_real = 0;
				spawn_rate_real += 0.5;
				spawn_rate_real = clamp(spawn_rate_real, 0, 3);
				global.game_combat_state = CombatState.Idle;
				spawn_time = 60 * spawn_interval[global.game_combat_state];
				audio_play_sound(spawn_music_stinger[2], 3, false);
			
				audio_sound_gain(spawn_music_main[CombatState.Idle], 0, 0);
				audio_sound_gain(spawn_music_main[CombatState.Idle], 1, 8000);
				audio_sound_gain(spawn_music_main[CombatState.Buildup], 0, 2000);
				audio_sound_gain(spawn_music_main[CombatState.Climax], 0, 2000);
			}
		
			break;
	}
}else if (global.boss_current == -1) && (global.level_current != 9){
	audio_sound_gain(spawn_music_main[CombatState.Idle], 0, 7000);
	audio_sound_gain(spawn_music_main[CombatState.Buildup], 0, 7000);
	audio_sound_gain(spawn_music_main[CombatState.Climax], 0, 7000);
	global.game_combat_state = CombatState.Idle;
	spawn_state_time_real = 0;
	spawn_time = 60 * spawn_interval[global.game_combat_state];
}

// Restoring Music after Pause
if (!global.game_pause){
	if (spawn_pause_update){
		spawn_pause_update = global.game_pause;
		
		// Play other music.
		if (global.level_current != 9){
			audio_resume_sound(spawn_music_main[CombatState.Idle]);
			audio_resume_sound(spawn_music_main[CombatState.Buildup]);
			audio_resume_sound(spawn_music_main[CombatState.Climax]);
		}
		
		if (global.level_current == 0) || (global.level_current == 6){
			audio_resume_sound(rain);
		}
		
		if (global.level_current == 3) || (global.level_current == 5) || (global.level_current == 7){
			audio_resume_sound(wind);
		}
		
		if (bossmusic != noone){
			audio_resume_sound(bossmusic);
		}
	}
}else{
	spawn_pause_update = true;
}
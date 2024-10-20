///@param newlevel
var newlevel = argument0;

if (audio_is_playing(m_boss_main_0)){
	audio_sound_gain(m_boss_main_0, 0, 3000);
}

if (newlevel){
	if (audio_is_playing(m_combat_main_0)){
		audio_sound_gain(m_combat_main_0, 0, 5000);
	}

	if (audio_is_playing(m_combat_windy_0)){
		audio_sound_gain(m_combat_windy_0, 0, 5000);
	}

	if (audio_is_playing(m_combat_underground_0)){
		audio_sound_gain(m_combat_underground_0, 0, 5000);
	}

	if (audio_is_playing(m_combat_city_0)){
		audio_sound_gain(m_combat_city_0, 0, 5000);
	}

	if (audio_is_playing(m_combat_main_1)){
		audio_sound_gain(m_combat_main_1, 0, 5000);
	}

	if (audio_is_playing(m_combat_windy_1)){
		audio_sound_gain(m_combat_windy_1, 0, 5000);
	}

	if (audio_is_playing(m_combat_underground_1)){
		audio_sound_gain(m_combat_underground_1, 0, 5000);
	}

	if (audio_is_playing(m_combat_city_1)){
		audio_sound_gain(m_combat_city_1, 0, 5000);
	}

	if (audio_is_playing(m_combat_main_2)){
		audio_sound_gain(m_combat_main_2, 0, 5000);
	}

	if (audio_is_playing(m_combat_windy_2)){
		audio_sound_gain(m_combat_windy_2, 0, 5000);
	}

	if (audio_is_playing(m_combat_underground_2)){
		audio_sound_gain(m_combat_underground_2, 0, 5000);
	}

	if (audio_is_playing(m_combat_city_2)){
		audio_sound_gain(m_combat_city_2, 0, 5000);
	}
	
	scr_checkpoint_reset();
}

if (audio_is_playing(m_ambience_rain_0)){
	audio_sound_gain(m_ambience_rain_0, 0, 3000);
}

if (audio_is_playing(m_ambience_wind_0)){
	audio_sound_gain(m_ambience_wind_0, 0, 3000);
}

if (audio_is_playing(m_ambience_birds_0)){
	audio_sound_gain(m_ambience_birds_0, 0, 3000);
}

if (audio_is_playing(snd_character_burn_0)){
	audio_stop_sound(snd_character_burn_0);
}

if (audio_is_playing(snd_other_heartbeat_0)){
	audio_stop_sound(snd_other_heartbeat_0);
}

if (audio_is_playing(snd_other_conveyerbelt_0)){
	audio_stop_sound(snd_other_conveyerbelt_0);
}

if (audio_is_playing(snd_other_conveyerbelt_1)){
	audio_stop_sound(snd_other_conveyerbelt_1);
}

if (audio_is_playing(snd_other_typing_0)){
	audio_stop_sound(snd_other_typing_0);
}

if (audio_is_playing(snd_weapon_flamethrower_active_0)){
	audio_stop_sound(snd_weapon_flamethrower_active_0);
}

if (audio_is_playing(snd_weapon_flamethrower_active_1)){
	audio_stop_sound(snd_weapon_flamethrower_active_1);
}

if (audio_is_playing(snd_other_fly_0)){
	audio_stop_sound(snd_other_fly_0);
}

if (audio_is_playing(snd_object_minecart_0)){
	audio_stop_sound(snd_object_minecart_0);
}

if (audio_is_playing(snd_object_hordepost_loop_normal)){
	audio_stop_sound(snd_object_hordepost_loop_normal);
}

if (audio_is_playing(snd_object_hordepost_loop_windy)){
	audio_stop_sound(snd_object_hordepost_loop_windy);
}

if (audio_is_playing(snd_object_hordepost_loop_underground)){
	audio_stop_sound(snd_object_hordepost_loop_underground);
}

if (audio_is_playing(snd_object_hordepost_loop_city)){
	audio_stop_sound(snd_object_hordepost_loop_city);
}

if (audio_is_playing(snd_object_train_start_left_0)){
	audio_stop_sound(snd_object_train_start_left_0);
}

if (audio_is_playing(snd_object_train_loop_left_0)){
	audio_stop_sound(snd_object_train_loop_left_0);
}

if (audio_is_playing(snd_object_train_end_left_0)){
	audio_stop_sound(snd_object_train_end_left_0);
}

if (audio_is_playing(snd_object_train_start_right_0)){
	audio_stop_sound(snd_object_train_start_right_0);
}

if (audio_is_playing(snd_object_train_loop_right_0)){
	audio_stop_sound(snd_object_train_loop_right_0);
}

if (audio_is_playing(snd_object_train_end_right_0)){
	audio_stop_sound(snd_object_train_end_right_0);
}

if (global.cutscene_current != -1){
	global.cutscene_time[global.cutscene_current] = 0;
	global.cutscene_current = -1;
}

scr_fade_object_list_reset();

global.boss_current = -1;
global.game_combat_in_hordechallenge = false;
global.game_combat_in_hordechallenge_time = 0;
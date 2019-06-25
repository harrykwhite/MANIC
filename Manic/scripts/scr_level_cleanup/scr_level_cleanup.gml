///@param newlevel
var newlevel = argument0;

if (audio_is_playing(m_boss_main_0)){
	audio_sound_gain(m_boss_main_0, 0, 3000);
}

if (newlevel){
	if (audio_is_playing(m_combat_main_0)){
		audio_sound_gain(m_combat_main_0, 0, 8000);
	}

	if (audio_is_playing(m_combat_windy_0)){
		audio_sound_gain(m_combat_windy_0, 0, 8000);
	}

	if (audio_is_playing(m_combat_underground_0)){
		audio_sound_gain(m_combat_underground_0, 0, 8000);
	}

	if (audio_is_playing(m_combat_city_0)){
		audio_sound_gain(m_combat_city_0, 0, 8000);
	}

	if (audio_is_playing(m_combat_main_1)){
		audio_sound_gain(m_combat_main_1, 0, 8000);
	}

	if (audio_is_playing(m_combat_windy_1)){
		audio_sound_gain(m_combat_windy_1, 0, 8000);
	}

	if (audio_is_playing(m_combat_underground_1)){
		audio_sound_gain(m_combat_underground_1, 0, 8000);
	}

	if (audio_is_playing(m_combat_city_1)){
		audio_sound_gain(m_combat_city_1, 0, 8000);
	}

	if (audio_is_playing(m_combat_main_2)){
		audio_sound_gain(m_combat_main_2, 0, 8000);
	}

	if (audio_is_playing(m_combat_windy_2)){
		audio_sound_gain(m_combat_windy_2, 0, 8000);
	}

	if (audio_is_playing(m_combat_underground_2)){
		audio_sound_gain(m_combat_underground_2, 0, 8000);
	}

	if (audio_is_playing(m_combat_city_2)){
		audio_sound_gain(m_combat_city_2, 0, 8000);
	}
}

if (audio_is_playing(m_ambience_rain_0)){
	audio_sound_gain(m_ambience_rain_0, 0, 5000);
}

if (audio_is_playing(m_ambience_wind_0)){
	audio_sound_gain(m_ambience_wind_0, 0, 5000);
}

if (audio_is_playing(m_ambience_birds_0)){
	audio_sound_gain(m_ambience_birds_0, 0, 5000);
}

if (audio_is_playing(snd_character_burn_0)){
	audio_sound_gain(snd_character_burn_0, 0, 4000);
}

if (audio_is_playing(snd_other_heartbeat_0)){
	audio_sound_gain(snd_other_heartbeat_0, 0, 3000);
}

if (audio_is_playing(snd_other_conveyerbelt_0)){
	audio_sound_gain(snd_other_conveyerbelt_0, 0, 3000);
}

if (audio_is_playing(snd_other_conveyerbelt_1)){
	audio_sound_gain(snd_other_conveyerbelt_1, 0, 3000);
}

if (audio_is_playing(snd_other_typing_0)){
	audio_sound_gain(snd_other_typing_0, 0, 3000);
}

if (audio_is_playing(snd_weapon_flamethrower_active_0)){
	audio_sound_gain(snd_weapon_flamethrower_active_0, 0, 2000);
}

if (audio_is_playing(snd_other_fly_0)){
	audio_sound_gain(snd_other_fly_0, 0, 2000);
}

if (global.cutscene_current != -1){
	global.cutscene_time[global.cutscene_current] = 0;
	global.cutscene_current = -1;
}

scr_fade_object_list_reset();
global.boss_current = -1;
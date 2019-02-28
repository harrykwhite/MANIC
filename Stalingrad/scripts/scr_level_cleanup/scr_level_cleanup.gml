if (audio_is_playing(m_combat_main_0)){
	audio_sound_gain(m_combat_main_0, 0, 2000);
}

if (audio_is_playing(m_combat_windy_0)){
	audio_sound_gain(m_combat_windy_0, 0, 2000);
}

if (audio_is_playing(m_combat_underground_0)){
	audio_sound_gain(m_combat_underground_0, 0, 2000);
}

if (audio_is_playing(m_combat_city_0)){
	audio_sound_gain(m_combat_city_0, 0, 2000);
}

if (audio_is_playing(m_combat_main_1)){
	audio_sound_gain(m_combat_main_1, 0, 2000);
}

if (audio_is_playing(m_combat_windy_1)){
	audio_sound_gain(m_combat_windy_1, 0, 2000);
}

if (audio_is_playing(m_combat_underground_1)){
	audio_sound_gain(m_combat_underground_1, 0, 2000);
}

if (audio_is_playing(m_combat_city_1)){
	audio_sound_gain(m_combat_city_1, 0, 2000);
}

if (audio_is_playing(m_combat_main_2)){
	audio_sound_gain(m_combat_main_2, 0, 2000);
}

if (audio_is_playing(m_combat_windy_2)){
	audio_sound_gain(m_combat_windy_2, 0, 2000);
}

if (audio_is_playing(m_combat_underground_2)){
	audio_sound_gain(m_combat_underground_2, 0, 2000);
}

if (audio_is_playing(m_combat_city_2)){
	audio_sound_gain(m_combat_city_2, 0, 2000);
}

if (audio_is_playing(m_ambience_rain_0)){
	audio_sound_gain(m_ambience_rain_0, 0, 2000);
}

if (audio_is_playing(m_ambience_wind_0)){
	audio_sound_gain(m_ambience_wind_0, 0, 2000);
}

if (audio_is_playing(snd_character_burn_0)){
	audio_sound_gain(snd_character_burn_0, 0, 2000);
}

if (audio_is_playing(snd_weapon_flamethrower_active_0)){
	audio_sound_gain(snd_weapon_flamethrower_active_0, 0, 2000);
}

scr_fade_object_list_reset();
global.game_combat_state = CombatState.Idle;
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

if (global.level_current < array_length_1d(global.level_name)){
	global.level_current++;
	scr_global_set();
	room_goto(global.level_room[global.level_current]);
}else{
	global.level_current = 0;
	scr_global_set();
	room_goto(global.level_room[0]);
}
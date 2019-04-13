background_01 = -1;
background_02 = -1;

sound_break_0 = 0;
lighting = 1;

spawn = false;
spawn_time = 60 * 10;

spawn_x = 572;
if (global.game_level_opening_type == 0){
	spawn_y = 247;
}else if (global.game_level_opening_type == 1){
	spawn_y = room_height - 247;
}

// Spawn System
scr_spawn_setup("windy", 1);
spawn_pause_update = false;
spawn_state_time_real = 0;
spawn_rate_real = 1;
spawn_cleared = false;

// Other
rain = audio_play_sound(m_ambience_rain_0, 3, true);
audio_sound_gain(rain, 0, 0);
audio_sound_gain(rain, 1 * obj_controller_all.real_ambience_volume, 12000);
rain_thunder = noone;
rain_thunder_interval = 60 * 9;

rain_thunder_flash[0] = m_ambience_thunder_0;
rain_thunder_flash_amount[0] = 0.8;

rain_thunder_flash[1] = m_ambience_thunder_1;
rain_thunder_flash_amount[1] = 0.9;

rain_thunder_flash[2] = m_ambience_thunder_2;
rain_thunder_flash_amount[2] = 0.5;

rain_thunder_flash[3] = m_ambience_thunder_3;
rain_thunder_flash_amount[3] = 0.7;

rain_thunder_flash[4] = m_ambience_thunder_4;
rain_thunder_flash_amount[4] = 0.8;

rain_thunder_flash[5] = m_ambience_thunder_5;
rain_thunder_flash_amount[5] = 0.2;

rain_thunder_flash[6] = m_ambience_thunder_6;
rain_thunder_flash_amount[6] = 0.1;

dog_can_spawn = global.game_firstdog_killed;

if (global.game_level_opening_type == 2){
	global.cutscene_current = 47;
}else{
	global.cutscene_current = 2;
}

sprite_index = noone;
depth = -5;
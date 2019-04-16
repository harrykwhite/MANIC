// Variables
background_01 = -1;
background_02 = -1;

sound_break_0 = 0;
lighting = 1;

spawn = false;
spawn_time = 60 * 10;

// Spawn System
scr_spawn_setup("main", 1.5);
global.game_combat_state_time_real = 0;
spawn_pause_update = false;
spawn_rate_real = 1;
spawn_cleared = false;

switch(room){
	case rm_level_6_00:
		spawn_x = 656;
		spawn_y = 245;
		break;

	case rm_level_6_01:
		if (global.game_level_opening_type == 0){
			spawn_x = -1;
			spawn_y = -1;
		}else{
			spawn_x = 866;
			spawn_y = 232;
		}
		break;
}

if (global.game_level_opening_type == 1) && (room == rm_level_6_00){
	global.cutscene_current = 47;
}else{
	if (global.game_level_opening_type == 0) && (room == rm_level_6_01){
		global.cutscene_current = 47;
	}else{
		global.cutscene_current = 2;
	}
}

// Other
sprite_index = noone;
depth = -5;

wind = audio_play_sound(m_ambience_wind_0, 3, true);
audio_sound_gain(wind, 0, 0);
audio_sound_gain(wind, 1 * obj_controller_all.real_ambience_volume, 7000);

train_time = 0;
train_timemax = 10 * 60;

trainboss_trainhead = noone;
trainboss_leader = noone;
trainboss_time = 0;
trainboss_timemax = 60 * 45;
trainboss_spawned = false;

healer_can_spawn = global.game_firsthealer_killed;
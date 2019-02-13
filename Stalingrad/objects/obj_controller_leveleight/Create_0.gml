// Variables
background_01 = -1;
background_02 = -1;

sound_break_0 = 0;
lighting = 1;

spawn = false;
spawn_time = 60 * 10;

// Spawn System
scr_spawn_setup("city", 1.35);
spawn_state_time_real = 0;
spawn_pause_update = false;
spawn_rate_real = 1;
spawn_cleared = false;

// Objective System
objective_update = false;

switch(room){
	case rm_level_8_00:
		spawn_x = 360;
		spawn_y = 525;
		
		objective_title[0] = "Clear the area of 10 enemies";
		objective_type[0] = ObjectiveType.Kill;
		objective_type_kill_number[0] = 10;
		objective_type_kill_number_max[0] = objective_type_kill_number[0];

		objective_title[1] = "Move north to the next area";
		objective_type[1] = ObjectiveType.Clear;
		break;
	
	case rm_level_8_01:
		spawn_x = 462;
		spawn_y = 575;
		
		objective_title[0] = "Clear the area of 15 enemies";
		objective_type[0] = ObjectiveType.Kill;
		objective_type_kill_number[0] = 15;
		objective_type_kill_number_max[0] = objective_type_kill_number[0];

		objective_title[1] = "Move north to the next area";
		objective_type[1] = ObjectiveType.Clear;
		break;
	
	case rm_level_8_02:
		spawn_x = 541;
		spawn_y = 440;
		
		objective_title[0] = "Clear the area of 10 enemies";
		objective_type[0] = ObjectiveType.Kill;
		objective_type_kill_number[0] = 10;
		objective_type_kill_number_max[0] = objective_type_kill_number[0];

		objective_title[1] = "Move north to leave the area";
		objective_type[1] = ObjectiveType.Clear;
		break;
}

global.game_objective_current = 0;

wind = audio_play_sound(m_ambience_wind_0, 3, true);
audio_sound_gain(wind, 0, 0);
audio_sound_gain(wind, 1, 9000);

// Other
global.cutscene_current = 2;
sprite_index = noone;
depth = -5;
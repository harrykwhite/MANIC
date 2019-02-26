// Variables
background_01 = -1;
background_02 = -1;

sound_break_0 = 0;
lighting = 1;

spawn = false;
spawn_time = 60 * 10;

switch(room){
	case rm_level_4_00:
		spawn_x = 463;
		if (global.game_level_opening_type == 0){
			spawn_y = 183;
		}else if (global.game_level_opening_type == 2){
			spawn_y = 620;
		}
		
		#region Objective
		objective_title[0] = "Clear the area of 15 enemies";
		objective_type[0] = ObjectiveType.Kill;
		objective_type_kill_number[0] = 15;
		objective_type_kill_number_max[0] = objective_type_kill_number[0];

		objective_title[1] = "Move south to the next area";
		objective_type[1] = ObjectiveType.Clear;
		#endregion
		break;
	
	case rm_level_4_01:
		spawn_x = 888;
		if (global.game_level_opening_type == 0){
			spawn_y = 183;
		}else if (global.game_level_opening_type == 1){
			spawn_y = 694;
		}
		
		#region Objective
		objective_title[0] = "Deactivate all generator terminals (0 / 3)";
		objective_type[0] = noone;

		objective_title[1] = "Deactivate all generator terminals (1 / 3)";
		objective_type[1] = noone;
		
		objective_title[2] = "Deactivate all generator terminals (2 / 3)";
		objective_type[2] = noone;
		
		objective_title[3] = "";
		objective_type[3] = noone;
		
		objective_title[4] = "Move south to leave the area";
		objective_type[4] = ObjectiveType.Clear;
		#endregion
		break;
}

scr_spawn_setup("windy", 1.15);
spawn_pause_update = false;
spawn_state_time_real = 0;
spawn_rate_real = 1;
spawn_cleared = false;

// Objective System
objective_update = false;
global.game_objective_current = 0;

wind = audio_play_sound(m_ambience_wind_0, 3, true);
audio_sound_gain(wind, 0, 0);
audio_sound_gain(wind, 1, 7000);

// Other
dogkeeper = noone;
dogkeeper_failed = false;

crazy_can_spawn = global.game_firstcrazy_killed;

if (room == rm_level_4_00) && (global.game_level_opening_type == 1){
	global.cutscene_current = 47;
}else{
	global.cutscene_current = 2;
}

sprite_index = noone;
depth = -5;
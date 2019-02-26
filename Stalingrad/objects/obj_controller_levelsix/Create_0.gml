// Variables
background_01 = -1;
background_02 = -1;

sound_break_0 = 0;
lighting = 1;

spawn = false;
spawn_time = 60 * 10;

// Spawn System
scr_spawn_setup("main", 1.25);
spawn_state_time_real = 0;
spawn_pause_update = false;
spawn_rate_real = 1;
spawn_cleared = false;

// Objective System
objective_update = false;
objective_special_boss_object = noone;

switch(room){
	case rm_level_6_00:
		spawn_x = 656;
		spawn_y = 245;
		
		objective_title[0] = "Clear the area of 15 enemies";
		objective_type[0] = ObjectiveType.Kill;
		objective_type_kill_number[0] = 15;
		objective_type_kill_number_max[0] = objective_type_kill_number[0];

		objective_title[1] = "";
		objective_type[1] = noone;

		objective_title[2] = "Wait for the train to arrive";
		objective_type[2] = noone;

		objective_title[3] = "Board the train"
		objective_type[3] = ObjectiveType.Clear;
		break;

	case rm_level_6_01:
		if (global.game_level_opening_type == 0){
			spawn_x = -1;
			spawn_y = -1;
		}else{
			spawn_x = 866;
			spawn_y = 232;
		}
		
		objective_title[0] = "Clear the area of 10 enemies";
		objective_type[0] = ObjectiveType.Kill;
		objective_type_kill_number[0] = 10;
		objective_type_kill_number_max[0] = objective_type_kill_number[0];
		
		objective_title[1] = "Move east to leave the area";
		objective_type[1] = ObjectiveType.Clear;
		break;
}

if (global.game_level_opening_type == 1){
	global.cutscene_current = 47;
}else{
	global.cutscene_current = 2;
}
global.game_objective_current = 0;

// Other
sprite_index = noone;
depth = -5;

wind = audio_play_sound(m_ambience_wind_0, 3, true);
audio_sound_gain(wind, 0, 0);
audio_sound_gain(wind, 1, 7000);

train_time = 0;
train_timemax = 10 * 60;
trainobjective_time = 10 * 60;

healer_can_spawn = global.game_firsthealer_killed;
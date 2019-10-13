// Variables
background_01 = -1;
background_02 = -1;

sound_break_0 = 0;
lighting = 1;

spawn = false;

switch(room){
	case rm_level_4_pre_00:
		if (global.game_level_opening_type == 0){
			spawn_x = 536;
			spawn_y = 322;
		}else if (global.game_level_opening_type == 1){
			spawn_x = 844;
			spawn_y = 2148;
		}
		break;
	
	case rm_level_4_00:
		if (global.game_level_opening_type == 0){
			if (global.worldtrain_room == room){
				obj_player.y = 196;
			}
		}
		
		spawn_x = 463;
		
		if (global.game_level_opening_type == 0){
			spawn_y = 192;
			
			if (global.worldtrain_room == room){
				spawn_y = 250;
			}
		}else if (global.game_level_opening_type == 2){
			spawn_y = 584;
		}
		break;
	
	case rm_level_4_01:
		spawn_x = 486;
		if (global.game_level_opening_type == 0){
			spawn_y = 192;
		}else if (global.game_level_opening_type == 1){
			spawn_y = 640;
		}
		break;
	
	case rm_level_4_02:
		spawn_x = 604;
		if (global.game_level_opening_type == 0){
			spawn_y = 192;
		}else if (global.game_level_opening_type == 1){
			spawn_y = 616;
		}
		break;
	
	case rm_level_4_03:
		spawn_x = 888;
		if (global.game_level_opening_type == 0){
			spawn_y = 192;
		}else if (global.game_level_opening_type == 1){
			spawn_y = 624;
		}
		break;
	
	case rm_level_4_post_00:
		if (global.game_level_opening_type == 0){
			spawn_x = 334;
			spawn_y = 192;
		}else if (global.game_level_opening_type == 1){
			spawn_x = 1376;
			spawn_y = 624;
		}
		break;
	
	case rm_level_4_post_01:
		if (global.game_level_opening_type == 0){
			spawn_x = 455;
			spawn_y = 192;
		}else if (global.game_level_opening_type == 1){
			spawn_x = 2222;
			spawn_y = 540;
		}
		break;
}

scr_spawn_setup("windy", 1.3);
spawn_pause_update = false;
spawn_rate_real = 1;
spawn_cleared = false;

if (!audio_is_playing(m_ambience_wind_0)){
	audio_play_sound(m_ambience_wind_0, 3, true);
	audio_sound_gain(m_ambience_wind_0, 0, 0);
}

audio_sound_gain(m_ambience_wind_0, 1 * obj_controller_all.real_ambience_volume, 7000);

// Other
room_music_transition = false;

dogkeeper = noone;
dogkeeper_failed = false;

terminal_deactivate_count = 0;

crazy_can_spawn = global.game_firstcrazy_killed;

prelevel_dialogue_time = 60 * 3.5;
prelevel_dialogue_index = 0;
prelevel_dialogue_inst = noone;
prelevel_dialogue_exception = false;

if (room == rm_level_4_00) && (global.game_level_opening_type == 1){
	global.cutscene_current = 47;
}else{
	global.cutscene_current = 2;
}

sprite_index = noone;
depth = -5;
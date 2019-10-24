// Variables
background_01 = -1;
background_02 = -1;

sound_break_0 = 0;
lighting = 1;

spawn = false;

if (!instance_exists(obj_player)){
	instance_create(0, 0, obj_player);
}

global.player_footstep_default = snd_character_footstep_grass;

// Spawn System
scr_spawn_setup("city", 1.8);
spawn_pause_update = false;
spawn_rate_real = 1;
spawn_cleared = false;

switch(room){
	case rm_level_9_00:
		obj_player.x = 640;
		obj_player.y = room_height + 6;
		
		if (global.game_level_opening_type == 0){
			spawn_x = 640;
			spawn_y = 704;
		}else{
			obj_player.x = 136;
			obj_player.y = -6;
			
			spawn_x = 136;
			spawn_y = 140;
		}
		break;
	
	case rm_level_9_01:
		obj_player.x = 920;
		obj_player.y = room_height + 6;
		
		if (global.game_level_opening_type == 0){
			spawn_x = 920;
			spawn_y = 1196;
		}else{
			obj_player.x = 278;
			obj_player.y = -6;
			
			spawn_x = 278;
			spawn_y = 126;
		}
		break;
	
	case rm_level_9_02:
		obj_player.x = 694;
		obj_player.y = room_height + 6;
		
		if (global.game_level_opening_type == 0){
			spawn_x = 694;
			spawn_y = 640;
		}else{
			obj_player.x = 714;
			obj_player.y = -6;
			
			spawn_x = 714;
			spawn_y = 202;
		}
		break;
}

scr_room_spawn_companion();

if (!audio_is_playing(m_ambience_wind_0)){
	audio_play_sound(m_ambience_wind_0, 3, true);
	audio_sound_gain(m_ambience_wind_0, 0, 0);
}

audio_sound_gain(m_ambience_wind_0, 1 * obj_controller_all.real_ambience_volume, 7000);

// Other
companions_spawned = false;
room_music_transition = false;

global.cutscene_current = 2;

sprite_index = noone;
depth = -5;
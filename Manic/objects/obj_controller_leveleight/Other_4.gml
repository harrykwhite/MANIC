if (global.pers_runthrough){
	instance_deactivate_object(object_index);
	return;
}

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
scr_spawn_setup("city");
spawn_pause_update = false;
spawn_rate_real = 1;
spawn_cleared = false;

switch(room){
	case rm_level_8_00:
		obj_player.x = 360;
		obj_player.y = room_height + 6;
		
		if (global.game_level_opening_type == 0){
			spawn_x = 360;
			spawn_y = 1035;
		}else{
			obj_player.x = 360;
			obj_player.y = -6;
			
			spawn_x = 360;
			spawn_y = 152;
		}
		break;
	
	case rm_level_8_01:
		obj_player.x = 462;
		obj_player.y = room_height + 6;
		
		if (global.game_level_opening_type == 0){
			spawn_x = 462;
			spawn_y = 654;
		}else{
			obj_player.x = 462;
			obj_player.y = -6;
			
			spawn_x = 462;
			spawn_y = 146;
		}
		break;
	
	case rm_level_8_02:
		obj_player.x = 374;
		obj_player.y = room_height + 6;
		
		if (global.game_level_opening_type == 0){
			spawn_x = 374;
			spawn_y = 862;
		}else{
			obj_player.x = 374;
			obj_player.y = -6;
			
			spawn_x = 374;
			spawn_y = 144;
		}
		break;
	
	case rm_level_8_post_00:
		obj_player.x = 374;
		obj_player.y = room_height + 6;
		
		if (global.game_level_opening_type == 0){
			spawn_x = 374;
			spawn_y = 1352;
		}else{
			obj_player.x = 374;
			obj_player.y = -6;
			
			spawn_x = 374;
			spawn_y = 144;
		}
		break;
}

// Other
companions_spawned = false;
room_music_transition = false;

global.cutscene_current = 2;

sprite_index = noone;
depth = -5;
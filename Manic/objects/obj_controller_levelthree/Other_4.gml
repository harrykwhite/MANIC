background_01 = -1;
background_02 = -1;

sound_break_0 = 0;
lighting = 1;

spawn = false;

if (!instance_exists(obj_player)){
	instance_create(0, 0, obj_player);
}

global.player_footstep_default = snd_character_footstep_wood;

switch(room){
	case rm_level_3_00:
		obj_player.x = 24;
		obj_player.y = 170;
		
		if (global.game_level_opening_type == 0){
			spawn_x = 295;
			spawn_y = 170;
		}else{
			obj_player.x = 1600;
			obj_player.y = room_height + 4;
			
			spawn_x = 1600;
			spawn_y = 1218;
		}
		break;
	
	case rm_level_3_01:
		obj_player.x = 462;
		obj_player.y = -4;
		
		if (global.game_level_opening_type == 0){
			spawn_x = 462;
			spawn_y = 200;
		}else{
			obj_player.x = room_width + 4;
			obj_player.y = 760;
			
			spawn_x = 956;
			spawn_y = 760;
		}
		break;
	
	case rm_level_3_02:
		obj_player.x = 62;
		obj_player.y = 308;
		
		if (global.game_level_opening_type == 0){
			spawn_x = 220;
			spawn_y = 308;
		}else{
			obj_player.x = room_width + 4;
			obj_player.y = 640;
			
			spawn_x = 2167;
			spawn_y = 640;
		}
		break;
	
	case rm_level_3_post_00:
		obj_player.x = -4;
		obj_player.y = 1338;
		
		if (global.game_level_opening_type == 0){
			spawn_x = 220;
			spawn_y = 1338;
		}else{
			obj_player.x = 1536;
			obj_player.y = room_height + 4;
			
			spawn_x = 1536;
			spawn_y = 1396;
		}
		break;
}

scr_room_spawn_companion();

// Spawn System
room_music_transition = false;
scr_spawn_setup("underground", 1.2);
spawn_pause_update = false;
spawn_rate_real = 1;
spawn_cleared = false;

// Other
companions_spawned = false;
global.cutscene_current = 2;

sprite_index = noone;
depth = -5;
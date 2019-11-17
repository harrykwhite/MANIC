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

global.player_footstep_default = snd_character_footstep_wood;

switch(room){
	case rm_level_5_00:
		obj_player.x = 982;
		obj_player.y = 1488;
		
		if (global.game_level_opening_type == 0){
			spawn_x = 982;
			spawn_y = 1308;
		}else if (global.game_level_opening_type == 1){
			obj_player.x = 864;
			obj_player.y = -4;
			
			spawn_x = 864;
			spawn_y = 194;
		}
		break;
	
	case rm_level_5_01:
		obj_player.x = 1146;
		obj_player.y = room_height + 4;
		
		if (global.game_level_opening_type == 0){
			spawn_x = 1146;
			spawn_y = 426;
		}else if (global.game_level_opening_type == 1){
			obj_player.x = -4;
			obj_player.y = 432;
			
			spawn_x = 157;
			spawn_y = 432;
		}
		break;
	
	case rm_level_5_02:
		obj_player.x = 1191;
		obj_player.y = 253;
		
		if (global.game_level_opening_type == 0){
			spawn_x = 940;
			spawn_y = 253;
		}else if (global.game_level_opening_type == 1){
			obj_player.x = -4;
			obj_player.y = 260;
			
			spawn_x = 270;
			spawn_y = 252;
		}
		break;
	
	case rm_level_5_03:
		obj_player.x = 1191;
		obj_player.y = 258;
		
		if (global.game_level_opening_type == 0){
			spawn_x = 940;
			spawn_y = 258;
		}else if (global.game_level_opening_type == 1){
			obj_player.x = -4;
			obj_player.y = 688;
			
			spawn_x = 154;
			spawn_y = 688;
		}
		break;
	
	case rm_level_5_04:
		obj_player.x = room_width + 4;
		obj_player.y = 253;
		
		if (global.game_level_opening_type == 0){
			spawn_x = 940;
			spawn_y = 253;
		}else if (global.game_level_opening_type == 1){
			obj_player.x = 615;
			obj_player.y = room_height + 4;
			
			spawn_x = 616;
			spawn_y = 626;
		}
		break;
	
	case rm_level_5_post_00:
		obj_player.x = 1528;
		obj_player.y = -4;
		
		if (global.game_level_opening_type == 0){
			spawn_x = 1528;
			spawn_y = 228;
		}else if (global.game_level_opening_type == 1){
			obj_player.x = -4;
			obj_player.y = 208;
			
			spawn_x = 208;
			spawn_y = 140;
		}
		break;
}

// Spawn System
scr_spawn_setup("underground");
spawn_pause_update = false;
spawn_rate_real = 1;
spawn_cleared = false;

// Other
companions_spawned = false;
room_music_transition = false;
sniper_can_spawn = global.game_firstsniper_killed;

global.cutscene_current = 2;

sprite_index = noone;
depth = -5;
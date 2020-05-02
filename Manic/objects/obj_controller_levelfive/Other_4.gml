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
		obj_player.y = room_height + 6;
		
		if (global.game_level_opening_type == 0){
			spawn_x = 982;
			spawn_y = room_height - walkindist;
		}else if (global.game_level_opening_type == 1){
			obj_player.x = 864;
			obj_player.y = -6;
			
			spawn_x = 864;
			spawn_y = walkindist;
		}
		break;
	
	case rm_level_5_01:
		obj_player.x = 1146;
		obj_player.y = room_height + 6;
		
		if (global.game_level_opening_type == 0){
			spawn_x = 1146;
			spawn_y = room_height - walkindist;
		}else if (global.game_level_opening_type == 1){
			obj_player.x = -6;
			obj_player.y = 432;
			
			spawn_x = walkindist;
			spawn_y = 432;
		}
		break;
	
	case rm_level_5_02:
		obj_player.x = room_width + 6;
		obj_player.y = 252;
		
		if (global.game_level_opening_type == 0){
			spawn_x = room_width - walkindist;
			spawn_y = 252;
		}else if (global.game_level_opening_type == 1){
			obj_player.x = -6;
			obj_player.y = 252;
			
			spawn_x = walkindist;
			spawn_y = 252;
		}
		break;
	
	case rm_level_5_03:
		obj_player.x = room_width + 6;
		obj_player.y = 258;
		
		if (global.game_level_opening_type == 0){
			spawn_x = room_width - walkindist;
			spawn_y = 258;
		}else if (global.game_level_opening_type == 1){
			obj_player.x = -6;
			obj_player.y = 688;
			
			spawn_x = walkindist;
			spawn_y = 688;
		}
		break;
	
	case rm_level_5_04:
		obj_player.x = room_width + 6;
		obj_player.y = 252;
		
		if (global.game_level_opening_type == 0){
			spawn_x = room_width - walkindist;
			spawn_y = 252;
		}else if (global.game_level_opening_type == 1){
			obj_player.x = 616;
			obj_player.y = room_height + 6;
			
			spawn_x = 616;
			spawn_y = room_height - walkindist;
		}
		break;
	
	case rm_level_5_post_00:
		obj_player.x = 1528;
		obj_player.y = -6;
		
		if (global.game_level_opening_type == 0){
			spawn_x = 1528;
			spawn_y = walkindist;
		}else if (global.game_level_opening_type == 1){
			obj_player.x = -6;
			obj_player.y = 140;
			
			spawn_x = walkindist;
			spawn_y = 140;
		}
		break;
}

// Spawn System
scr_spawn_setup("underground");
spawn_pause_update = false;
spawn_rate_real = 1;
spawn_cleared = false;

// Camera
if (instance_exists(obj_controller_camera)){
	obj_controller_camera.x = obj_player.x;
	obj_controller_camera.y = obj_player.y;
}

// Other
companions_spawned = false;
room_music_transition = false;
sniper_can_spawn = global.game_firstsniper_killed;

global.cutscene_current = 2;

sprite_index = noone;
depth = -5;
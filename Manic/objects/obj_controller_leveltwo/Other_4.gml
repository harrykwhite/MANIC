if (global.pers_runthrough){
	instance_deactivate_object(object_index);
	return;
}

background_01 = -1;
background_02 = -1;

sound_break_0 = 0;
lighting = 1;

spawn = false;

if (!instance_exists(obj_player)){
	instance_create(0, 0, obj_player);
}

global.player_footstep_default = snd_character_footstep_grass;

switch(room){
	case rm_level_2_pre_00:
		obj_player.x = 446;
		obj_player.y = -6;
		
		if (global.game_level_opening_type == 0){
			spawn_x = 446;
			spawn_y = walkindist;
		}else{
			obj_player.x = room_width + 6;
			obj_player.y = 428;
			
			spawn_x = room_width - walkindist;
			spawn_y = 428;
		}
		break;
	
	case rm_level_2_00:
		obj_player.x = -6;
		obj_player.y = 298;
		
		if (global.game_level_opening_type == 0){
			spawn_x = walkindist;
			spawn_y = 298;
		}else{
			obj_player.x = 566;
			obj_player.y = room_height + 6;
			
			spawn_x = 566;
			spawn_y = room_height - walkindist;
		}
		break;
	
	case rm_level_2_01:
		obj_player.x = 368;
		obj_player.y = -6;
		
		if (global.game_level_opening_type == 0){
			spawn_x = 368;
			spawn_y = walkindist;
		}else{
			obj_player.x = 344;
			obj_player.y = room_height + 6;
			
			spawn_x = 344;
			spawn_y = room_height - walkindist;
		}
		break;
	
	case rm_level_2_02:
		obj_player.x = 548;
		obj_player.y = -6;
		
		if (global.game_level_opening_type == 0){
			spawn_x = 548;
			spawn_y = walkindist;
		}else{
			obj_player.x = 548;
			obj_player.y = room_height + 6;
			
			spawn_x = 548;
			spawn_y = room_height - walkindist;
		}
		break;
	
	case rm_level_2_03:
		obj_player.x = 358;
		obj_player.y = -6;
		
		if (global.game_level_opening_type == 0){
			spawn_x = 358;
			spawn_y = walkindist;
		}else{
			obj_player.x = 358;
			obj_player.y = room_height + 6;
			
			spawn_x = 358;
			spawn_y = room_height - walkindist;
		}
		break;
	
	case rm_level_2_04:
		obj_player.x = 358;
		obj_player.y = -6;
		
		if (global.game_level_opening_type == 0){
			spawn_x = 358;
			spawn_y = walkindist;
		}else{
			obj_player.x = 358;
			obj_player.y = room_height + 6;
			
			spawn_x = 358;
			spawn_y = room_height - walkindist;
		}
		break;
	
	case rm_level_2_post_00:
		obj_player.x = 368;
		obj_player.y = -6;
		
		if (global.game_level_opening_type == 0){
			spawn_x = 368;
			spawn_y = walkindist;
		}else{
			obj_player.x = 2106;
			obj_player.y = 638;
			
			spawn_x = 2106;
			spawn_y = 790;
		}
		break;
}

// Spawn System
scr_spawn_setup("main");
spawn_pause_update = false;

spawn_rate_real = 1;
spawn_cleared = false;

postlevel_dialogue_time = 60 * 3;
postlevel_dialogue_index = 0;
postlevel_dialogue_inst = noone;
postlevel_dialogue_exception = false;

// Camera
if (instance_exists(obj_controller_camera)){
	obj_controller_camera.x = obj_player.x;
	obj_controller_camera.y = obj_player.y;
}

// Other
companions_spawned = false;
room_music_transition = false;

global.cutscene_current = 2;

sprite_index = noone;
depth = -5;
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
	case rm_level_9_00:
		obj_player.x = 640;
		obj_player.y = room_height + 6;
		
		if (global.game_level_opening_type == 0){
			spawn_x = 640;
			spawn_y = 694;
		}else{
			obj_player.x = 136;
			obj_player.y = -6;
			
			spawn_x = 136;
			spawn_y = 180;
		}
		break;
	
	case rm_level_9_01:
		obj_player.x = 920;
		obj_player.y = room_height + 6;
		
		if (global.game_level_opening_type == 0){
			spawn_x = 920;
			spawn_y = 976;
		}else{
			obj_player.x = 278;
			obj_player.y = -6;
			
			spawn_x = 278;
			spawn_y = 160;
		}
		break;
	
	case rm_level_9_02:
		obj_player.x = 694;
		obj_player.y = room_height + 6;
		
		if (global.game_level_opening_type == 0){
			spawn_x = 694;
			spawn_y = 580;
		}else{
			obj_player.x = 714;
			obj_player.y = -6;
			
			spawn_x = 714;
			spawn_y = 202;
		}
		break;
}

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
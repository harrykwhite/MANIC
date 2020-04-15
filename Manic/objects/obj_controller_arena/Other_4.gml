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
	case rm_arena_1_00:
		obj_player.x = 826;
		obj_player.y = room_height + 6;
		
		spawn_x = obj_player.x;
		spawn_y = room_height - 200;
		
		wave_spawn_rate_change = 0.25;
		break;
	
	case rm_arena_2_00:
		obj_player.x = 1151;
		obj_player.y = room_height + 6;
		
		spawn_x = obj_player.x;
		spawn_y = room_height - 200;
		
		wave_spawn_rate_change = 0.3;
		break;
}

// Spawn System
scr_spawn_setup("main");
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

global.cutscene_current = 2;

sprite_index = noone;
depth = -5;
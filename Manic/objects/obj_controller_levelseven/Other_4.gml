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
scr_spawn_setup("city", 1.6);
spawn_pause_update = false;
spawn_rate_real = 1;
spawn_cleared = false;

switch(room){
	case rm_level_7_00:
		obj_player.x = -4;
		obj_player.y = 192;
		
		if (global.game_level_opening_type == 0){
			spawn_x = 170;
			spawn_y = 192;
		}else{
			obj_player.x = room_width + 4;
			obj_player.y = 228;
			
			spawn_x = 1092;
			spawn_y = 232;
		}
		break;
	
	case rm_level_7_01:
		obj_player.x = -4;
		obj_player.y = 832;
		
		if (global.game_level_opening_type == 0){
			spawn_x = 170;
			spawn_y = 832;
		}else{
			obj_player.x = room_width + 4;
			obj_player.y = 208;
			
			spawn_x = 910;
			spawn_y = 208;
		}
		break;
	
	case rm_level_7_02:
		obj_player.x = -4;
		obj_player.y = 1704;
		
		if (global.game_level_opening_type == 0){
			spawn_x = 170;
			spawn_y = 1704;
		}else{
			obj_player.x = room_width / 2;
			obj_player.y = -4;
			
			spawn_x = room_width / 2;
			spawn_y = 170;
		}
		break;
	
	case rm_level_7_03:
		obj_player.x = room_width / 2;
		obj_player.y = room_height + 4;
		
		spawn_x = room_width / 2;
		
		if (global.game_level_opening_type == 0){
			spawn_y = 1024;
		}else{
			obj_player.y = -4;
			spawn_y = 192;
		}
		break;
	
	case rm_level_7_post_00:
		obj_player.x = 446;
		obj_player.y = room_height + 4;
		
		if (global.game_level_opening_type == 0){
			spawn_x = 446;
			spawn_y = 1292;
		}else{
			obj_player.x = 1382;
			obj_player.y = -4;
			
			spawn_x = 1382;
			spawn_y = 150;
		}
		break;
}

// Other
companions_spawned = false;
room_music_transition = false;
fly_can_spawn = global.game_firstflyhead_killed;

global.cutscene_current = 2;

sprite_index = noone;
depth = -5;
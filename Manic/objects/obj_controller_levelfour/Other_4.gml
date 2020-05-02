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

switch(room){
	case rm_level_4_pre_00:
		obj_player.x = 536;
		obj_player.y = 160;
		
		if (global.game_level_opening_type == 0){
			spawn_x = 536;
			spawn_y = obj_player.y + 6 + walkindist;
		}else if (global.game_level_opening_type == 1){
			obj_player.x = 844;
			obj_player.y = room_height + 6;
			
			spawn_x = 844;
			spawn_y = room_height - walkindist;
		}
		break;
	
	case rm_level_4_00:
		obj_player.x = 463;
		obj_player.y = -6;
		
		global.game_companion_farmer_level4pre_talked_0 = true;
		
		spawn_x = 463;
		
		if (global.game_level_opening_type == 0){
			spawn_y = walkindist;
			
			if (global.worldtrain_room == room){
				spawn_y = 260;
				obj_player.y = 196;
				
				var trainidle = instance_create(592, 112, obj_pawn_other_train_1);
				trainidle.component_spawn = true;
				trainidle.spd = 1;
			}
		}else if (global.game_level_opening_type == 2){
			spawn_y = room_height - walkindist;
			
			obj_player.x = 463;
			obj_player.y = room_height + 6;
		}
		break;
	
	case rm_level_4_01:
		obj_player.x = 486;
		obj_player.y = -6;
		
		spawn_x = 486;
		if (global.game_level_opening_type == 0){
			spawn_y = walkindist;
		}else if (global.game_level_opening_type == 1){
			spawn_y = room_height - walkindist;
			obj_player.y = room_height + 6;
		}
		break;
	
	case rm_level_4_02:
		obj_player.x = 604;
		obj_player.y = -6;
		
		spawn_x = 604;
		if (global.game_level_opening_type == 0){
			spawn_y = walkindist;
		}else if (global.game_level_opening_type == 1){
			spawn_y = room_height - walkindist;
			obj_player.y = room_height + 6;
		}
		break;
	
	case rm_level_4_03:
		obj_player.x = 888;
		obj_player.y = -6;
		
		spawn_x = 888;
		if (global.game_level_opening_type == 0){
			spawn_y = walkindist;
		}else if (global.game_level_opening_type == 1){
			spawn_y = room_height - walkindist;
			obj_player.y = room_height + 6;
		}
		break;
	
	case rm_level_4_post_00:
		obj_player.x = 334;
		obj_player.y = -6;
		
		if (global.game_level_opening_type == 0){
			spawn_x = 334;
			spawn_y = walkindist;
		}else if (global.game_level_opening_type == 1){
			spawn_x = 1376;
			spawn_y = room_height - walkindist;
			
			obj_player.x = 1376;
			obj_player.y = room_height + 6;
		}
		break;
	
	case rm_level_4_post_01:
		obj_player.x = 455;
		obj_player.y = -6;
		
		if (global.game_level_opening_type == 0){
			spawn_x = 455;
			spawn_y = walkindist;
		}else if (global.game_level_opening_type == 1){
			spawn_x = 2222;
			spawn_y = 540;
			
			obj_player.x = 2222;
			obj_player.y = 360;
		}
		break;
}

// Spawn System
scr_spawn_setup("windy");
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

dogkeeper = noone;
dogkeeper_failed = false;

terminal_deactivate_count = 0;

crazy_can_spawn = global.game_firstcrazy_killed;

level_dialogue_time = 60 * 3.5;
level_dialogue_index = 0;
level_dialogue_inst = noone;
level_dialogue_exception = false;

if (room == rm_level_4_00) && (global.game_level_opening_type == 1){
	global.cutscene_current = 47;
	
	var train = instance_create_layer(-353, 117, "Trains", obj_pawn_other_train_1);
	train.component_spawn = true;
	obj_player.x = -100;
	obj_player.y = -100;
}else{
	global.cutscene_current = 2;
}

sprite_index = noone;
depth = -5;
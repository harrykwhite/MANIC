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
	case rm_level_1_00:
		obj_player.x = 572;
		obj_player.y = -6;
		
		spawn_x = 572;
		
		if (global.game_level_opening_type == 0){
			spawn_y = walkindist;
		}else if (global.game_level_opening_type == 1){
			obj_player.y = room_height + 6;
			spawn_y = room_height - walkindist;
		}
		
		if (global.worldtrain_room == room) && (global.game_level_opening_type != 2){
			var trainidle = instance_create(953, 1984, obj_pawn_other_train_1);
			trainidle.component_spawn = true;
			trainidle.spd = 1;
		}
		break;
	
	case rm_level_1_01:
		obj_player.x = 518;
		obj_player.y = -6;
		
		spawn_x = 518;
		
		if (global.game_level_opening_type == 0){
			spawn_y = walkindist;
		}else if (global.game_level_opening_type == 1){
			obj_player.y = room_height + 6;
			spawn_y = room_height - walkindist;
		}
		break;
}

// Spawn System
room_music_transition = false;
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

rain_thunder = noone;
rain_thunder_interval = 60 * 9;

rain_thunder_flash[0] = m_ambience_thunder_0;
rain_thunder_flash_amount[0] = 0.8;

rain_thunder_flash[1] = m_ambience_thunder_1;
rain_thunder_flash_amount[1] = 0.9;

rain_thunder_flash[2] = m_ambience_thunder_2;
rain_thunder_flash_amount[2] = 0.5;

rain_thunder_flash[3] = m_ambience_thunder_3;
rain_thunder_flash_amount[3] = 0.7;

rain_thunder_flash[4] = m_ambience_thunder_4;
rain_thunder_flash_amount[4] = 0.8;

rain_thunder_flash[5] = m_ambience_thunder_5;
rain_thunder_flash_amount[5] = 0.2;

rain_thunder_flash[6] = m_ambience_thunder_6;
rain_thunder_flash_amount[6] = 0.1;

dog_can_spawn = global.game_firstdog_killed;

factory_explode = false;
factory_explode_effects_created = false;
factory_explode_alpha_max = 1;
factory_explode_alpha = factory_explode_alpha_max;
factory_explode_look_wait = -1;

factory_level_lighting_offset = 0;

if (global.game_level_opening_type == 2){
	global.cutscene_current = 47;
	
	var train = instance_create_layer(-115, 1984, "Trains", obj_pawn_other_train_1);
	train.component_spawn = true;
	obj_player.x = -100;
	obj_player.y = -100;
}else{
	global.cutscene_current = 2;
}

sprite_index = noone;
depth = -5;
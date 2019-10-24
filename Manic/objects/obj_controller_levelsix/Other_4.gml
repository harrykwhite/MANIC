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
scr_spawn_setup("main", 1.5);
spawn_pause_update = false;
spawn_rate_real = 1;
spawn_cleared = false;

switch(room){
	case rm_level_6_pre_00:
		obj_player.x = 702;
		obj_player.y = 2106;
		
		if (global.game_level_opening_type == 0){
			spawn_x = 702;
			spawn_y = 2216;
		}else{
			obj_player.x = 526;
			obj_player.y = -6;
			
			spawn_x = 526;
			spawn_y = 140;
		}
		break;
	
	case rm_level_6_00:
		obj_player.x = 656;
		obj_player.y = room_height + 6;
		
		spawn_x = 656;
		spawn_y = 245;
		
		if (global.worldtrain_room == room) && (global.game_level_opening_type != 1) && (global.game_boss_trainhorde_killed){
			var trainidle = instance_create(821, 224, obj_pawn_other_train_1);
			trainidle.component_spawn = true;
			trainidle.spd = 1;
		}
		break;

	case rm_level_6_01:
		obj_player.x = -100;
		obj_player.y = -100;
		
		if (global.game_level_opening_type == 0){
			spawn_x = -1;
			spawn_y = -1;
			
			var train = instance_create(-170, 224, obj_pawn_other_train_1);
			train.component_spawn = true;
			obj_player.x = -100;
			obj_player.y = -100;
		}else{
			obj_player.x = room_width + 4;
			obj_player.y = 232;
			
			spawn_x = 866;
			spawn_y = 232;
			
			if (global.worldtrain_room == room){
				var trainidle = instance_create(816, 224, obj_pawn_other_train_1);
				trainidle.component_spawn = true;
				trainidle.spd = 0;
			}
		}
		break;
	
	case rm_level_6_02:
		obj_player.x = -4;
		obj_player.y = 232;
		
		if (global.game_level_opening_type == 0){
			spawn_x = 120;
			spawn_y = 232;
		}else{
			obj_player.x = room_width + 4;
			obj_player.y = 232;
			
			spawn_x = 1182;
			spawn_y = 232;
		}
		break;
}

if (global.game_level_opening_type == 1) && (room == rm_level_6_00){
	global.cutscene_current = 47;
	
	var train = instance_create_layer(-247, 224, "Trains", obj_pawn_other_train_1);
	train.component_spawn = true;
	obj_player.x = -100;
	obj_player.y = -100;
}else{
	if (global.game_level_opening_type == 0) && (room == rm_level_6_01){
		global.cutscene_current = 47;
	}else{
		global.cutscene_current = 2;
	}
}

// Other
companions_spawned = false;
room_music_transition = false;

sprite_index = noone;
depth = -5;

if (!audio_is_playing(m_ambience_wind_0)){
	audio_play_sound(m_ambience_wind_0, 3, true);
	audio_sound_gain(m_ambience_wind_0, 0, 0);
}

audio_sound_gain(m_ambience_wind_0, 1 * obj_controller_all.real_ambience_volume, 7000);

if (room == rm_level_6_01) || (room == rm_level_6_02){
	global.game_objective_complete = true;
}

train_time = 0;
train_timemax = 10 * 60;

trainboss_trainhead = noone;
trainboss_leader = noone;
trainboss_time = 0;
trainboss_timemax = 60 * 75;
trainboss_spawned = false;

healer_can_spawn = global.game_firsthealer_killed;
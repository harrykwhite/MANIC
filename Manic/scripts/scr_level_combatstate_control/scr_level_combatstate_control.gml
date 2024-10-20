// Changing Combat States
var bossmusic = noone;
var level = scr_level_get_index(room);
var paused = global.game_pause;
var arena = scr_level_is_arena();
var inrealboss = global.boss_current != -1;
var inhordechallenge = global.game_combat_in_hordechallenge;

if (global.boss_current == Boss.MotherRobot) || (global.boss_current == Boss.SniperRobot){
	inrealboss = false;
}

if (inhordechallenge) && (!paused){
	if (global.game_combat_in_hordechallenge_time > 0){
		global.game_combat_in_hordechallenge_time --;
	}else{
		global.game_combat_in_hordechallenge = false;
		global.game_combat_state = CombatState.Idle;
		global.game_combat_state_time_real = 0;
		inhordechallenge = false;
		
		spawn_time = 60 * spawn_interval[global.game_combat_state];
		
		audio_sound_gain(spawn_music_main[CombatState.Idle], 0, 0);
		audio_sound_gain(spawn_music_main[CombatState.Idle], 1 * obj_controller_all.real_music_volume, 8000);
		audio_sound_gain(spawn_music_main[CombatState.Buildup], 0, 2000);
		audio_sound_gain(spawn_music_main[CombatState.Climax], 0, 2000);
		
		audio_sound_gain(global.boss_music[0], 0, 5000);
		audio_play_sound(global.boss_stinger[0], 3, false);
		
		var uindex = -1;
		var ux = -1;
		var uy = -1;
		
		switch(level){
			case Level.UndergroundBunker:
				uindex = PlayerUpgrade.ShoulderBand;
				ux = 1760;
				uy = 552;
				
				global.game_hordechallenge0_completed = true;
				break;
			
			case Level.TrainStation:
				uindex = PlayerUpgrade.Goggles;
				ux = 500;
				uy = 280;
				
				global.game_hordechallenge1_completed = true;
				break;
			
			case Level.DesolateVillage:
				uindex = PlayerUpgrade.IronGlove;
				ux = 636;
				uy = 616;
				
				global.game_hordechallenge2_completed = true;
				break;
		}
		
		if (uindex != -1) && (instance_exists(obj_player)){
			var upgrade = instance_create(ux, uy, obj_upgrade_pickup);
			upgrade.index = uindex;
			upgrade.angle = random_range(-10, 10);
			
			if (point_distance(obj_player.x, obj_player.y, ux, uy) > 150){
				var cutsceneblock = instance_create(ux, uy, obj_block_cutscene);
				cutsceneblock.image_xscale = 6;
				cutsceneblock.image_yscale = 6;
				cutsceneblock.x -= cutsceneblock.sprite_width / 2;
				cutsceneblock.y -= cutsceneblock.sprite_height / 2;
				cutsceneblock.index = 53;
				cutsceneblock.destroy_on_nocutscene = true;
			
				global.cutscene_current = 40;
				obj_controller_gameplay.cutscene_look_x = ux;
				obj_controller_gameplay.cutscene_look_y = uy;
				obj_controller_gameplay.cutscene_look_time = 85;
				obj_controller_gameplay.cutscene_look_object = noone;
				obj_controller_gameplay.cutscene_look_prop = false;
			}else{
				global.cutscene_current = 53;
			}
		}
	}
}

if (inrealboss) || (inhordechallenge){
	if (inhordechallenge){
		bossmusic = global.boss_music[0];
	}else{
		bossmusic = global.boss_music[global.boss_current];
	}
	
	if (bossmusic != noone){
		var setToGain = false;
		
		if (!paused){
			while (!audio_is_playing(bossmusic)){
				audio_play_sound(bossmusic, 3, true);
				audio_sound_gain(bossmusic, 0.02, 0);
				setToGain = true;
			
				if (level != Level.CityHeadquarters) && (level != Level.Prologue){
					audio_sound_gain(spawn_music_main[CombatState.Idle], 0, 5000);
					audio_sound_gain(spawn_music_main[CombatState.Buildup], 0, 5000);
					audio_sound_gain(spawn_music_main[CombatState.Climax], 0, 5000);
				}
			}
		
			while(audio_sound_get_gain(bossmusic) <= 0.01){
				audio_sound_gain(m_boss_main_0, 0.02, 0);
				setToGain = true;
			}
		
			if (setToGain){
				audio_sound_gain(bossmusic, 1 * obj_controller_all.real_music_volume, 4000);
			}
		}
	}
}

if (audio_is_playing(m_boss_main_0)){
	if (audio_sound_get_gain(m_boss_main_0) <= 0.01){
		audio_stop_sound(m_boss_main_0);
	}
}

if (!paused) && (!inrealboss) && (level != Level.CityHeadquarters) && (level != Level.Prologue) && (!inhordechallenge) && (!scr_level_is_peaceful(room)){
	switch(global.game_combat_state){
		case CombatState.Idle:
			if (global.game_combat_state_time_real >= (60 * spawn_state_time[global.game_combat_state])){
				// Change the combat state to build up.
				global.game_combat_state_time_real = 0;
				global.game_combat_state = CombatState.Buildup;
				spawn_time = 60 * spawn_interval[global.game_combat_state];
				
				// Play the stinger noise.
				var stinger = audio_play_sound(spawn_music_stinger[0], 3, false);
				audio_sound_gain(stinger, 0.7 * obj_controller_all.real_music_volume, 0);
				
				// Reset build up and climax music, lower Idle music.
				audio_sound_gain(spawn_music_main[CombatState.Idle], 0.7 * obj_controller_all.real_music_volume, 3000);
				audio_sound_gain(spawn_music_main[CombatState.Buildup], 1 * obj_controller_all.real_music_volume, 12000);
			}else{
				// Idle Music
				if (!audio_is_playing(spawn_music_main[CombatState.Idle])) || ((audio_sound_get_gain(spawn_music_main[CombatState.Idle]) <= 0) && (obj_controller_all.real_music_volume > 0)){
					audio_stop_sound(spawn_music_main[CombatState.Idle]);
					audio_play_sound(spawn_music_main[CombatState.Idle], 3, true);
					audio_sound_gain(spawn_music_main[CombatState.Idle], 0.01 * obj_controller_all.real_music_volume, 0);
					audio_sound_gain(spawn_music_main[CombatState.Idle], 1 * obj_controller_all.real_music_volume, 3000);
				}else{
					audio_sound_gain(spawn_music_main[CombatState.Idle], 1 * obj_controller_all.real_music_volume, 3000);
				}
				
				// Buildup Music
				if (!audio_is_playing(spawn_music_main[CombatState.Buildup])){
					audio_play_sound(spawn_music_main[CombatState.Buildup], 3, true);
					audio_sound_gain(spawn_music_main[CombatState.Buildup], 0, 0);
				}else{
					audio_sound_gain(spawn_music_main[CombatState.Buildup], 0, 2000);
				}
				
				// Climax Music
				if (!audio_is_playing(spawn_music_main[CombatState.Climax])){
					audio_play_sound(spawn_music_main[CombatState.Climax], 3, true);
					audio_sound_gain(spawn_music_main[CombatState.Climax], 0, 0);
				}else{
					audio_sound_gain(spawn_music_main[CombatState.Climax], 0, 2000);
				}
				
				if (room_music_transition){
					audio_sound_gain(spawn_music_main[CombatState.Idle], 1 * obj_controller_all.real_music_volume, 5000);
					audio_sound_gain(spawn_music_main[CombatState.Buildup], 0, 2000);
					audio_sound_gain(spawn_music_main[CombatState.Climax], 0, 2000);
					
					room_music_transition = false;
				}
			}
		
			break;
	
		case CombatState.Buildup:
			if (global.game_combat_state_time_real >= (60 * spawn_state_time[global.game_combat_state])){
				global.game_combat_state_time_real = 0;
				global.game_combat_state = CombatState.Climax;
				spawn_time = 60 * spawn_interval[global.game_combat_state];
				
				var stinger = audio_play_sound(spawn_music_stinger[1], 3, false);
				audio_sound_gain(stinger, 0.7 * obj_controller_all.real_music_volume, 0);
			
				audio_sound_gain(spawn_music_main[CombatState.Idle], 0, 3000);
				audio_sound_gain(spawn_music_main[CombatState.Buildup], 0.7 * obj_controller_all.real_music_volume, 3000);
				audio_sound_gain(spawn_music_main[CombatState.Climax], 1 * obj_controller_all.real_music_volume, 1500);
			}else{
				// Idle Music
				if (!audio_is_playing(spawn_music_main[CombatState.Idle])) || ((audio_sound_get_gain(spawn_music_main[CombatState.Idle]) <= 0) && (obj_controller_all.real_music_volume > 0)){
					audio_stop_sound(spawn_music_main[CombatState.Idle]);
					audio_play_sound(spawn_music_main[CombatState.Idle], 3, true);
					audio_sound_gain(spawn_music_main[CombatState.Idle], 0.01 * obj_controller_all.real_music_volume, 0);
					audio_sound_gain(spawn_music_main[CombatState.Idle], 0.7 * obj_controller_all.real_music_volume, 5000);
				}else{
					audio_sound_gain(spawn_music_main[CombatState.Idle], 0.7 * obj_controller_all.real_music_volume, 5000);
				}
				
				// Buildup Music
				if (!audio_is_playing(spawn_music_main[CombatState.Buildup])) || ((audio_sound_get_gain(spawn_music_main[CombatState.Buildup]) <= 0) && (obj_controller_all.real_music_volume > 0)){
					audio_play_sound(spawn_music_main[CombatState.Buildup], 3, true);
					audio_sound_gain(spawn_music_main[CombatState.Buildup], 0.01 * obj_controller_all.real_music_volume, 0);
					audio_sound_gain(spawn_music_main[CombatState.Buildup], 1 * obj_controller_all.real_music_volume, 5000);
				}else{
					audio_sound_gain(spawn_music_main[CombatState.Buildup], 1 * obj_controller_all.real_music_volume, 5000);
				}
				
				// Climax Music
				if (!audio_is_playing(spawn_music_main[CombatState.Climax])){
					audio_play_sound(spawn_music_main[CombatState.Climax], 3, true);
					audio_sound_gain(spawn_music_main[CombatState.Climax], 0, 0);
				}else{
					audio_sound_gain(spawn_music_main[CombatState.Climax], 0, 2000);
				}
				
				if (room_music_transition){
					audio_sound_gain(spawn_music_main[CombatState.Idle], 0.7 * obj_controller_all.real_music_volume, 5000);
					audio_sound_gain(spawn_music_main[CombatState.Buildup], 1 * obj_controller_all.real_music_volume, 5000);
					audio_sound_gain(spawn_music_main[CombatState.Climax], 0, 2000);
					
					room_music_transition = false;
				}
			}
		
			break;
	
		case CombatState.Climax:
			if (global.game_combat_state_time_real >= (60 * spawn_state_time[global.game_combat_state])) && (scr_enemy_nearby_count(500, false) <= 0){
				global.game_combat_state_time_real = 0;
				
				spawn_rate_real += 0.5;
				spawn_rate_real = clamp(spawn_rate_real, 0, 3);
				spawn_time = 60 * spawn_interval[global.game_combat_state];
				
				global.game_combat_state = CombatState.Idle;
				
				if (arena){
					scr_level_arena_wave_next();
				}
				
				var stinger = audio_play_sound(spawn_music_stinger[2], 3, false);
				audio_sound_gain(stinger, 0.9 * obj_controller_all.real_music_volume, 0);
				
				audio_sound_gain(spawn_music_main[CombatState.Idle], 0, 0);
				audio_sound_gain(spawn_music_main[CombatState.Idle], 1 * obj_controller_all.real_music_volume, 8000);
				audio_sound_gain(spawn_music_main[CombatState.Buildup], 0, 2000);
				audio_sound_gain(spawn_music_main[CombatState.Climax], 0, 2000);
			}else{
				// Idle Music
				if (!audio_is_playing(spawn_music_main[CombatState.Idle])){
					audio_stop_sound(spawn_music_main[CombatState.Idle]);
					audio_play_sound(spawn_music_main[CombatState.Idle], 3, true);
					audio_sound_gain(spawn_music_main[CombatState.Idle], 0, 0);
				}else{
					audio_sound_gain(spawn_music_main[CombatState.Idle], 0, 2000);
				}
				
				// Buildup Music
				if (!audio_is_playing(spawn_music_main[CombatState.Buildup])) || ((audio_sound_get_gain(spawn_music_main[CombatState.Buildup]) <= 0) && (obj_controller_all.real_music_volume > 0)){
					audio_play_sound(spawn_music_main[CombatState.Buildup], 3, true);
					audio_sound_gain(spawn_music_main[CombatState.Buildup], 0.01 * obj_controller_all.real_music_volume, 0);
					audio_sound_gain(spawn_music_main[CombatState.Buildup], 0.7 * obj_controller_all.real_music_volume, 5000);
				}else{
					audio_sound_gain(spawn_music_main[CombatState.Buildup], 0.7 * obj_controller_all.real_music_volume, 5000);
				}
				
				// Climax Music
				if (!audio_is_playing(spawn_music_main[CombatState.Climax])) || ((audio_sound_get_gain(spawn_music_main[CombatState.Climax]) <= 0) && (obj_controller_all.real_music_volume > 0)){
					audio_play_sound(spawn_music_main[CombatState.Climax], 3, true);
					audio_sound_gain(spawn_music_main[CombatState.Climax], 0.01 * obj_controller_all.real_music_volume, 0);
					audio_sound_gain(spawn_music_main[CombatState.Climax], 1 * obj_controller_all.real_music_volume, 5000);
				}else{
					audio_sound_gain(spawn_music_main[CombatState.Climax], 1 * obj_controller_all.real_music_volume, 5000);
				}
				
				if (room_music_transition){
					audio_sound_gain(spawn_music_main[CombatState.Idle], 0, 3000);
					audio_sound_gain(spawn_music_main[CombatState.Buildup], 0.7 * obj_controller_all.real_music_volume, 5000);
					audio_sound_gain(spawn_music_main[CombatState.Climax], 1 * obj_controller_all.real_music_volume, 5000);
					
					room_music_transition = false;
				}
			}
		
			break;
	}
}else if (!paused) && (level != Level.CityHeadquarters) && (level != Level.Prologue) && (!inhordechallenge){
	audio_sound_gain(spawn_music_main[CombatState.Idle], 0, 4000);
	audio_sound_gain(spawn_music_main[CombatState.Buildup], 0, 4000);
	audio_sound_gain(spawn_music_main[CombatState.Climax], 0, 4000);
	global.game_combat_state = CombatState.Idle;
	global.game_combat_state_time_real = 0;
	spawn_time = 60 * spawn_interval[global.game_combat_state];
}
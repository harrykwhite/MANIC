var player = obj_player;
var player_exists = instance_exists(player);

var peaceful = scr_level_is_peaceful(room);

scr_position_view();

crazy_can_spawn = global.game_firstcrazy_killed;

var camx = camera_get_view_x(view_camera[0]);
var camy = camera_get_view_y(view_camera[0]);
var camw = camera_get_view_width(view_camera[0]);
var camh = camera_get_view_height(view_camera[0]);

if (!global.game_pause){
	
	// Dust
	if (random(6) < 1) part_particles_create(global.ps_front, random_range(camx, camx + camw), random_range(camy, camy + camh), global.pt_dust_0, 1);
	if (random(8) < 1) part_particles_create(global.ps_front, random_range(camx, camx + camw), random_range(camy, camy + camh), global.pt_dust_1, 1);
	
	// Tumbleweed
	if (random(200) < 1){
		if (player_exists){
			if (instance_number(obj_environment_tumbleweed) < 5){
				var xx = camx + random(camw);
				var yy = camy + random(camh);
				var safe = 0;
				
				var groundlayer = layer_get_id("InteriorFloorWood");
				var groundmap = layer_tilemap_get_id(groundlayer);
		
				while(collision_rectangle(xx - 16, yy - 16, xx + 16, yy + 16, obj_p_solid, false, true) || tilemap_get_at_pixel(groundmap, xx, yy)){
					xx = camx + random(camw);
					yy = camy + random(camh);
		
					if (safe < 100){
						safe ++;
					}else{
						break;
					}
				}
			
				if (safe < 100){
					instance_create(xx, yy, obj_environment_tumbleweed);
				}
			}
		}
	}
	
	// Fog
	if (random(2.5) < 1){
		if (part_particles_count(global.pt_fog_0) < 40){
			part_particles_create(global.ps_front, camx + random_range(0, camw), camy + random_range(0, camh), global.pt_fog_0, 1);
		}
	}
	
	// Snow
	repeat(4){
	    part_particles_create(global.ps_front, camx + random_range(-450, camw), camy - 10, global.pt_snow_0, 1);
	}

	if (random(2) < 1){
	    part_particles_create(global.ps_bottom, camx + random_range(0, camw), camy + random_range(0, camh), global.pt_snow_1, 1);
	}
	
	// Pre Level Dialogue
	if (room == rm_level_4_pre_00){
		if (!global.game_companion_farmer_level4pre_talked_0) || (level_dialogue_exception){
			level_dialogue_exception = true;
			
			if (global.cutscene_current != 58){
				if (level_dialogue_time > 0){
					level_dialogue_time --;
					
					if (instance_exists(level_dialogue_inst)) && (obj_controller_ui.dialogue_time >= 0){
						obj_controller_ui.dialogue_x = level_dialogue_inst.x;
						obj_controller_ui.dialogue_y = level_dialogue_inst.y - 24;
					}
				}else{
					var text = "", inst = noone, dodraw = true;
			
					switch(level_dialogue_index){
						case 0:
							text = "It's time that we found out who the leader of the army is, so that we can prevent the group from making further advancements.";
							inst = obj_player;
							break;
						
						case 1:
							text = "Perhaps some of the artifacts in the town down below might give us an indication as to who that may be?";
							inst = obj_companion_0;
							break;
						
						case 2:
							text = "As well as that, there might be some people who we can ask about it.";
							inst = obj_companion_0;
							break;
						
						case 3:
							text = "I hope so. Let's keep going.";
							inst = obj_player;
							break;
						
						default:
							dodraw = false;
							
							obj_controller_ui.dialogue_x = level_dialogue_inst.x;
							obj_controller_ui.dialogue_y = level_dialogue_inst.y - 24;
							
							level_dialogue_exception = false;
							global.game_companion_farmer_level4pre_talked_0 = true;
							break;
					}
			
					if (dodraw) && (instance_exists(inst)){
						obj_controller_ui.dialogue = text;
						obj_controller_ui.dialogue_voice = (inst == obj_player ? snd_character_dialogue_protagonist_in : snd_character_dialogue_compfarmer_in);
						obj_controller_ui.dialogue_time = 60 * 6;
						obj_controller_ui.dialogue_pause = false;
						obj_controller_ui.dialogue_length = string_length(obj_controller_ui.dialogue);
						obj_controller_ui.dialogue_char_count = 0;
						obj_controller_ui.dialogue_x = inst.x;
						obj_controller_ui.dialogue_y = inst.y - 24;
						obj_controller_ui.dialogue_voice_opened = false;
						obj_controller_ui.dialogue_voice_closed = true;
						
						with(obj_sign_0){
							talking = false;
						}
					
						with(obj_sign_wall_0){
							talking = false;
						}
						
						if (level_dialogue_index < 4){
							level_dialogue_inst = inst;
							level_dialogue_index ++;
							level_dialogue_time = obj_controller_ui.dialogue_time;
						}else{
							level_dialogue_exception = false;
							global.game_companion_farmer_level4pre_talked_0 = true;
						}
					}
				}
			}
		}else{
			global.game_companion_farmer_level4pre_talked_0 = true;
		}
	}
	
	// Post Level Dialogue
	if (room == rm_level_4_post_01){
		if (!global.game_companion_farmer_level4post_talked_0) || (level_dialogue_exception){
			level_dialogue_exception = true;
			
			if (global.cutscene_current != 58){
				if (level_dialogue_time > 0){
					level_dialogue_time --;
					
					if (instance_exists(level_dialogue_inst)) && (obj_controller_ui.dialogue_time >= 0){
						obj_controller_ui.dialogue_x = level_dialogue_inst.x;
						obj_controller_ui.dialogue_y = level_dialogue_inst.y - 24;
					}
				}else{
					var text = "", inst = noone, dodraw = true;
			
					switch(level_dialogue_index){
						case 0:
							text = "I'm feeling that what we're doing isn't right... it's starting to go too far.";
							inst = obj_companion_0;
							break;
						
						case 1:
							text = "Is there not any other way to stop them, besides violence?";
							inst = obj_companion_0;
							break;
						
						case 2:
							text = "There is no other way. An enemy group like this will exhibit no mercy.";
							inst = obj_player;
							break;
						
						case 3:
							text = "Ultimately, they should be the ones to suffer, for all the pain they've inflicted.";
							inst = obj_player;
							break;
						
						default:
							dodraw = false;
							
							obj_controller_ui.dialogue_x = level_dialogue_inst.x;
							obj_controller_ui.dialogue_y = level_dialogue_inst.y - 24;
							
							level_dialogue_exception = false;
							global.game_companion_farmer_level4post_talked_0 = true;
							break;
					}
			
					if (dodraw) && (instance_exists(inst)){
						obj_controller_ui.dialogue = text;
						obj_controller_ui.dialogue_voice = (inst == obj_player ? snd_character_dialogue_protagonist_in : snd_character_dialogue_compfarmer_in);
						obj_controller_ui.dialogue_time = 60 * 6;
						obj_controller_ui.dialogue_pause = false;
						obj_controller_ui.dialogue_length = string_length(obj_controller_ui.dialogue);
						obj_controller_ui.dialogue_char_count = 0;
						obj_controller_ui.dialogue_x = inst.x;
						obj_controller_ui.dialogue_y = inst.y - 24;
						obj_controller_ui.dialogue_voice_opened = false;
						obj_controller_ui.dialogue_voice_closed = true;
						
						with(obj_sign_0){
							talking = false;
						}
					
						with(obj_sign_wall_0){
							talking = false;
						}
						
						if (level_dialogue_index < 4){
							level_dialogue_inst = inst;
							level_dialogue_index ++;
							level_dialogue_time = obj_controller_ui.dialogue_time;
						}else{
							level_dialogue_exception = false;
							global.game_companion_farmer_level4post_talked_0 = true;
						}
					}
				}
			}
		}else{
			global.game_companion_farmer_level4post_talked_0 = true;
		}
	}
}

// Music
if (!global.game_pause){
	if (!audio_is_playing(m_ambience_wind_0)) || (audio_sound_get_gain(m_ambience_wind_0) < 0.01){
		if (!audio_is_playing(m_ambience_wind_0)) audio_play_sound(m_ambience_wind_0, 3, true);
		audio_sound_gain(m_ambience_wind_0, 0.01, 0);
		audio_sound_gain(m_ambience_wind_0, windvolume * obj_controller_all.real_ambience_volume, 6000);
	}
}

// Checkpoint
if (global.cutscene_current == -1){
	if (room == rm_level_4_02){
		 if (!global.level_checkpoint_found[global.level_current, 0]){
			obj_controller_gameplay.checkpoint_create = true;
			global.level_checkpoint_found[global.level_current, 0] = true;
		}
	}else if (room == rm_level_4_03){
		 if (!global.level_checkpoint_found[global.level_current, 1]){
			obj_controller_gameplay.checkpoint_create = true;
			global.level_checkpoint_found[global.level_current, 1] = true;
		}
	}
}

// Spawning
var lighting_level; 
lighting_level[CombatState.Climax] = 1;
lighting_level[CombatState.Buildup] = 0.925;
lighting_level[CombatState.Idle] = 0.85;

var lighting = lighting_level[global.game_combat_state];

if (global.game_combat_in_hordechallenge){
	lighting = 1;
}

if (peaceful){
	lighting = 0.925;
}

global.game_lighting_level_to = lighting + scr_brightness_offset();

if (player_exists) && (global.cutscene_current == -1){
	if (abs(obj_player.len) > 0.1){
		if (spawn_start_wait < spawn_start_wait_max){
			spawn_start_wait ++;
		}
	}
}

if (spawn_start_wait >= spawn_start_wait_max){
	if (player_exists) && (!scr_level_is_peaceful(room)){
		var spawn_rate = spawn_rate_real;
		if (!global.game_pause) && ((global.boss_current == -1) || (global.boss_current == Boss.MotherRobot) || (global.boss_current == Boss.SniperRobot)) && (global.cutscene_current == -1){
			if (scr_on_heavy_weapon()){
				spawn_rate += 2.5;
			}
		
			if (global.game_combat_in_hordechallenge){
				spawn_rate += horde_spawn_rate;
			}else{
				global.game_combat_state_time_real ++;
			}
		
			spawn_rate += global.game_combat_playerskill - 1;
			
			if (global.game_combat_state_time_real < (60 * spawn_state_time[global.game_combat_state])){
				if (spawn_time > 0){
					spawn_time -= spawn_rate;
				}else{
					spawn = true;
					spawn_time = 60 * (global.game_combat_in_hordechallenge ? global.game_combat_in_hordechallenge_spawnbreak : spawn_interval[global.game_combat_state]);
				}
			}
			
			if (spawn){
				if (scr_enemy_count(false) < ((global.game_combat_in_hordechallenge || scr_on_heavy_weapon()) ? spawn_max[CombatState.Climax] : spawn_max[global.game_combat_state])){
					var xpos = random_range(camx - 10, camx + camw + 10);
					var ypos = random_range(camy - 10, camy + camh + 10);
					var spawn_trial = 0;
					var do_spawn = true;
				
					while(!scr_is_valid_enemyspawn(xpos, ypos)){
						xpos = random_range(camx - 10, camx + camw + 10);
						ypos = random_range(camy - 10, camy + camh + 10);
						spawn_trial ++;
				
						if (spawn_trial > 200){
							spawn_trial = 0;
							do_spawn = false;
							break;
						}
					}
					
					if (do_spawn){
						var weapon;
				
						if (chance(70)){
							weapon = choose(PawnWeapon.Crowbar, PawnWeapon.Axe, PawnWeapon.Machete);
						}else{
							weapon = choose(PawnWeapon.Grenade, PawnWeapon.Rake, PawnWeapon.Sledgehammer);
						}
				
						var enemy;
				
						if (chance(80)){
							enemy = instance_create(xpos, ypos, obj_enemy_0);
				
							if (spawn_rate > 1.4){
								if (global.boss_current == -1){
									if (chance(5)){
										enemy.type = Enemy0_Type.Mother;
									}
								}
							}
					
							if (crazy_can_spawn){
								if (chance(5)){
									enemy.type = Enemy0_Type.Crazy;
								}
							}
						
							if (global.game_combat_in_hordechallenge){
								enemy.type = Enemy0_Type.Normal;
							}
					
							if (weapon == PawnWeapon.Grenade){
								enemy.type = Enemy0_Type.Grenadier;
							}
				
							if (enemy.type == Enemy0_Type.Sniper){
								weapon = PawnWeapon.SniperRifle;
							}
				
							enemy.weapon_index = weapon;
						}else{
							enemy = instance_create(xpos, ypos, obj_enemy_2);
						}

						repeat(9){
							part_particles_create(global.ps_front, xpos + random_range(-7, 7), ypos + random_range(-18, 18), global.pt_spawn_0, 1);
						}
						
						spawn = false;
					}
				}
			}
		}
	}else{
		global.game_combat_state_time_real = 0;
		spawn_rate_real = 0.75;
		global.game_combat_state = CombatState.Idle;
	
		if (global.cutscene_current == -1){
			audio_sound_gain(spawn_music_main[CombatState.Idle], 0, 1000);
			audio_sound_gain(spawn_music_main[CombatState.Buildup], 0, 1000);
			audio_sound_gain(spawn_music_main[CombatState.Climax], 0, 1000);
		}
	}
}

scr_level_combatstate_control();

scr_level_audio_pause_and_resume();
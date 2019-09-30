var player = obj_player;
var player_exists = instance_exists(player);

var camx = camera_get_view_x(view_camera[0]);
var camy = camera_get_view_y(view_camera[0]);
var camw = camera_get_view_width(view_camera[0]);
var camh = camera_get_view_height(view_camera[0]);

scr_position_view();
dog_can_spawn = global.game_firstdog_killed;

if (!global.game_pause){
	
	// Dust
	if (random(5) < 1) part_particles_create(global.ps_front, camx + random(camw), camy + random(camh), global.pt_dust_0, 1);
	if (random(10) < 1) part_particles_create(global.ps_front, camx + random(camw), camy + random(camh), global.pt_dust_1, 1);
	
	// Birds
	if (random(180) < 1) && (instance_number(obj_bird_0) < 1){
		var bird;
		
		if (random(2) < 1){
			bird = instance_create(camx - 30, random_range(camy, camy + camh), obj_bird_0);
			bird.dir = 360 + random_range(-5, 5);
		}else{
			bird = instance_create(camx + camw + 30, random_range(camy, camy + camh), obj_bird_0);
			bird.dir = 180 + random_range(-5, 5);
		}
	}
	
	// Tumbleweed
	if (random(170) < 1){
		if (player_exists){
			if (instance_number(obj_environment_tumbleweed) < 5){
				var xx = camx + random(camw);
				var yy = camy + random(camh);
				var safe = 0;
		
				while(point_distance(xx, yy, player.x, player.y) < 200) || (place_meeting(xx, yy, obj_p_solid)) || (place_meeting(xx, yy, obj_interior_fade)){
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
		
	// Rain
	repeat(2){
	    part_particles_create(global.ps_front, camx + random_range(0, camw + 150), camy - 10, global.pt_rain_0, 1);
	}

	if (random(2) < 1){
		var dropx, dropy;
		
		do{
			dropx = camx + random_range(0, camw);
			dropy = camy + random_range(0, camh);
		}until(!scr_ceiling_at(dropx, dropy));
		
	    part_particles_create(global.ps_bottom, dropx, dropy, choose(global.pt_rain_1, global.pt_rain_2), 1);
	}
	
	// Fog
	if (random(2.5) < 1){
		if (part_particles_count(global.pt_fog_0) < 40){
			part_particles_create(global.ps_front, camx + random_range(0, camw), camy + random_range(0, camh), global.pt_fog_0, 1);
		}
	}
}

// Spawning
var lighting_level; 
lighting_level[CombatState.Climax] = 1;
lighting_level[CombatState.Buildup] = 0.94;
lighting_level[CombatState.Idle] = 0.875;

var lighting_to = lighting_level[global.game_combat_state];

if (global.game_combat_in_hordechallenge){
	lighting_to = 1;
}

if (scr_level_is_peaceful(room)){
	lighting_to = 0.875 + (room == rm_level_1_01 ? factory_level_lighting_offset : 0);
}

if (lighting < lighting_to){
	lighting += 0.004;
}else if (lighting > lighting_to){
	lighting -= 0.004;
}

global.ambientShadowIntensity = lighting;

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
			if ((global.weapon_slot_standalone == PlayerWeapon.MountedMachineGun) || (global.weapon_slot_standalone == PlayerWeapon.MountedMachineGunCart)){
				spawn_rate += 0.5;
			}
		
			if (global.game_combat_in_hordechallenge){
				spawn_rate += horde_spawn_rate;
			}else{
				global.game_combat_state_time_real ++;
			}
		
			spawn_rate += global.game_combat_playerskill - 1;
		
			if (spawn_time > 0){
				spawn_time -= spawn_rate;
			}else{
				spawn = true;
				spawn_time = 60 * spawn_interval[global.game_combat_state];
				spawn_time /= spawn_rate;
			}
		
			if (spawn){
				if (scr_enemy_count(false) < round(spawn_max[global.game_combat_state] * (1 + (0.5 * (spawn_rate - 1))))){
					var xpos = random_range(camx - 10, camx + camw + 10);
					var ypos = random_range(camy - 10, camy + camh + 10);
					var spawn_trial = 0;
				
					while(!scr_is_valid_enemyspawn(xpos, ypos) || ((!enemy_has_panned) && (point_distance(xpos, ypos, player.x, player.y) < 110))){
						xpos = random_range(camx - 10, camx + camw + 10);
						ypos = random_range(camy - 10, camy + camh + 10);
						spawn_trial ++;
					
						if (spawn_trial > 1000){
							spawn_trial = 0;
							return;
						}
					}
		
					var weapon;
				
					if (chance(90)){
						weapon = choose(PawnWeapon.Crowbar, PawnWeapon.Axe);
					}else{
						weapon = PawnWeapon.Knife;
					}
				
					var enemy;
				
					if (chance(80)) || (!dog_can_spawn){
						enemy = instance_create(xpos, ypos, obj_enemy_0);
					
						if (!enemy_has_panned){
							global.cutscene_current = 40;
							obj_controller_gameplay.cutscene_look_x = xpos;
							obj_controller_gameplay.cutscene_look_y = ypos;
							obj_controller_gameplay.cutscene_look_time = 85;
							obj_controller_gameplay.cutscene_look_object = enemy;
							obj_controller_gameplay.cutscene_look_prop = true;
						
							enemy_has_panned = true;
						}
					
						if (spawn_rate > 1.5){
							if (global.boss_current == -1){
								if (chance(5)){
									enemy.type = Enemy0_Type.Mother;
								}
							}
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
				}
			
				spawn = false;
			}
		
		}else if (global.game_pause){
			audio_pause_all();
			spawn_pause_update = false;
		}
	}else{
		global.game_combat_state_time_real = 0;
		spawn_rate_real = 0.75;
	
		if (global.cutscene_current == -1){
			audio_sound_gain(spawn_music_main[CombatState.Idle], 0, 1000);
			audio_sound_gain(spawn_music_main[CombatState.Buildup], 0, 1000);
			audio_sound_gain(spawn_music_main[CombatState.Climax], 0, 1000);
		}
	}
}

scr_level_combatstate_control();

if (!global.game_pause){
	if (rain_thunder_interval > 0){
		rain_thunder_interval--;
	}else{
		var index = random(array_length_1d(rain_thunder) - 1);
		rain_thunder_interval = 60 * random_range(10, 23);
		
		var thunder = audio_play_sound(rain_thunder_flash[index], 3, false);
		audio_sound_gain(thunder, 1 * obj_controller_all.real_ambience_volume, 0);
		
		scr_effect_flash(rain_thunder_flash_amount[index], 0.03, c_white, true);
	}
	
	if (!audio_is_playing(m_ambience_rain_0)){
		audio_play_sound(m_ambience_rain_0, 3, true);
		audio_sound_gain(m_ambience_rain_0, 0, 0);
		audio_sound_gain(m_ambience_rain_0, 1 * obj_controller_all.real_ambience_volume, 8000);
	}
}

// Factory level
if (factory_level_lighting_offset > -0.075){
	factory_level_lighting_offset -= 0.0001;
}

// Factory explode
if (!factory_explode){
	factory_explode_effects_created = false;
}

if (room == rm_level_1_01 && factory_explode && !factory_explode_effects_created){
	var x1 = 102;
	var y1 = 534;
	var x2 = 318;
	var y2 = 638;
	
	var list = ds_list_create();
	var count = collision_rectangle_list(x1, y1, x2, y2, all, false, true, list, false);
	
	for(var i = 0; i < count; i ++){
		var inst = list[| i];
		
		if (inst == noone){
			continue;
		}
		
		if (inst.object_index == obj_computer_desk_0) || (inst.object_index == obj_crate_large_0){
			inst.death = true;
			continue;
		}
		
		if (inst.object_index == obj_environment_skeleton_part || inst.object_index == obj_environment_soldier_head || inst.object_index == obj_environment_soldier_limbs){
			instance_destroy(inst);
			continue;
		}
	}
	
	ds_list_destroy(list);
	
	repeat(50){
		part_particles_create(global.ps_front, random_range(x1, x2), random_range(y1, y2), global.pt_smoke_7, 1);
	}
	
	repeat(45){
		part_particles_create(global.ps_bottom, random_range(x1, x2), random_range(y1, y2), global.pt_ash_0_perm, 1);
	}
	
	repeat(25){
		part_particles_create(global.ps_bottom, random_range(x1, x2), random_range(y1, y2), global.pt_wood_0, 1);
	}
	
	repeat(25){
		part_particles_create(global.ps_bottom, random_range(x1, x2), random_range(y1, y2), global.pt_scraps_0, 1);
	}
	
	scr_sound_play(snd_weapon_explode_0, false, 0.8, 0.8);
	scr_effect_zoom(-0.2);
	scr_effect_freeze(7);
	
	factory_explode_look_wait = 60 * 1.5;
	factory_explode_effects_created = true;
}

if (factory_explode_look_wait != -1 && factory_explode_look_wait > 0){
	factory_explode_look_wait --;
}else{
	if (factory_explode_look_wait != -1){
		global.cutscene_current = 40;
		
		scr_sound_play(snd_other_conveyerbelt_1, false, 1, 1);
		audio_stop_sound(snd_other_conveyerbelt_0);
		
		instance_destroy(inst_61DFEA24);
		
		with(obj_conveyerbelt_0){
			stop = true;
		}
		
		with(obj_controller_gameplay){
			cutscene_look_x = 688;
			cutscene_look_y = 780;
			cutscene_look_time = 60 * 2;
			cutscene_look_prop = false;
			cutscene_look_object = noone;
		}
		
		factory_explode_look_wait = -1;
	}
}
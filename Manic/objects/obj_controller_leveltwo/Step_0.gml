var player = obj_player;
var player_exists = instance_exists(player);
scr_position_view();

var camx = camera_get_view_x(view_camera[0]);
var camy = camera_get_view_y(view_camera[0]);
var camw = camera_get_view_width(view_camera[0]);
var camh = camera_get_view_height(view_camera[0]);

if (!global.game_pause){
	
	// Dust
	if (room != rm_level_2_pre_00){
		if (random(4.5) < 1) part_particles_create(global.ps_front, random_range(camx, camx + camw), random_range(camy, camy + camh), global.pt_dust_2, 1);
	}else{
		// Rain
		if (instance_exists(obj_player)){
			rainamount = (obj_player.x / room_width) * 5;
			rainamount ++;
		}
		
		if (random(rainamount / 1.15) < 1){
			part_particles_create(global.ps_front, camx + random_range(0, camw + 150), camy - 10, global.pt_rain_0, 1);
		}
		
		if (random(2 * rainamount) < 1){
		    part_particles_create(global.ps_bottom, camx + random_range(0, camw), camy + random_range(0, camh), choose(global.pt_rain_1, global.pt_rain_2), 1);
		}
		
		if (!audio_is_playing(rain)){
			rain = audio_play_sound(m_ambience_rain_0, 3, true);
			audio_sound_gain(rain, 0, 0);
			audio_sound_gain(rain, 1 * obj_controller_all.real_ambience_volume, 8000);
		}
	}
	
	if (random(6.5) < 1) part_particles_create(global.ps_front, random_range(camx, camx + camw), random_range(camy, camy + camh), global.pt_dust_0, 1);
	if (random(8.5) < 1) part_particles_create(global.ps_front, random_range(camx, camx + camw), random_range(camy, camy + camh), global.pt_dust_1, 1);
	
	// Tumbleweed
	if (random(200) < 1){
		if (instance_number(obj_environment_tumbleweed) < 5){
			var xx = random_range(camx, camx + camw);
			var yy = random_range(camy, camy + camh);
			var safe = 0;
			
			if (player_exists){
				while(point_distance(xx, yy, player.x, player.y) < 200) || (place_meeting(xx, yy, obj_p_solid)) || (scr_ceiling_at(xx, yy)){
					xx = random_range(camx, camx + camw);
					yy = random_range(camy, camy + camh);
		
					if (safe < 100){
						safe ++;
					}else{
						break;
					}
				}
			}
			
			if (safe < 100){
				instance_create(xx, yy, obj_environment_tumbleweed);
			}
		}
	}

	// Fog
	if (random(3) < 1){
		if (part_particles_count(global.pt_smoke_3) < 40){
			part_particles_create(global.ps_front, camx + random_range(0, camw), camy + random_range(0, camh), global.pt_smoke_3, 1);
		}
	}
	
	// Post Level Dialogue
	if (room == rm_level_2_post_00) && (global.cutscene_current == -1) && (postlevel_dialogue_index < postlevel_dialogue_index_max){
		if (postlevel_dialogue_time > 0){
			postlevel_dialogue_time --;
			
			if (instance_exists(postlevel_dialogue_inst)) && (obj_controller_ui.dialogue_time >= 0){
				obj_controller_ui.dialogue_x = postlevel_dialogue_inst.x;
				obj_controller_ui.dialogue_y = postlevel_dialogue_inst.y - 24;
			}
		}else{
			var text = "", inst = noone, dodraw = true;
			
			switch(postlevel_dialogue_index){
				case 0:
					text = "So what is making you want to fight them?";
					inst = obj_companion_0;
					break;
				
				case 1:
					text = "To help stop this?";
					inst = obj_companion_0;
			
				case 2:
					text = "My family was murdered by the group. I can't let that happen again.";
					inst = obj_player;
					break;
				
				case 3:
					text = "I understand.";
					inst = obj_companion_0;
					break;
				
				case 4:
					text = "It's lucky that you found me when you did.";
					inst = obj_companion_0;
					break;
				
				case 5:
					text = "Just a couple more hours there and I would have been killed.";
					inst = obj_companion_0;
					break;
				
				case 6:
					text = "Thank you for helping me.";
					inst = obj_companion_0;
					break;
				
				default:
					dodraw = false;
					break;
			}
			
			if (dodraw) && (instance_exists(inst)){
				obj_controller_ui.dialogue = text;
				obj_controller_ui.dialogue_time = 60 * 3;
				obj_controller_ui.dialogue_pause = false;
				obj_controller_ui.dialogue_count = 0;
				obj_controller_ui.dialogue_x = inst.x;
				obj_controller_ui.dialogue_y = inst.y - 24;
				
				postlevel_dialogue_inst = inst;
				postlevel_dialogue_index ++;
				postlevel_dialogue_time  = 60 * 3.5;
			}
		}
	}
}

// Spawning
var lighting_level; 
lighting_level[CombatState.Climax] = 1;
lighting_level[CombatState.Buildup] = 0.925;
lighting_level[CombatState.Idle] = 0.85;

var lighting_to = lighting_level[global.game_combat_state];

if (global.game_combat_in_hordechallenge){
	lighting_to = 1;
}

if (room == rm_level_2_pre_00) || (room == rm_level_2_post_00){
	lighting_to = 0.8;
}

if (lighting < lighting_to){
	lighting += 0.004;
}else if (lighting > lighting_to){
	lighting -= 0.004;
}

global.ambientShadowIntensity = lighting;

if (player_exists) && (room != rm_level_2_pre_00) && (room != rm_level_2_post_00){
	var spawn_rate = spawn_rate_real;
	if (global.game_combat_active) && (!global.game_pause) && (global.boss_current == -1) && (global.cutscene_current == -1) && ((!global.level_cleared[global.level_current]) || (global.game_combat_in_hordechallenge)){
		if ((global.weapon_slot_standalone == PlayerWeapon.MountedMachineGun) || (global.weapon_slot_standalone == PlayerWeapon.MountedMachineGunCart)){
			spawn_rate ++;
		}
		
		if (global.game_combat_in_hordechallenge){
			spawn_rate += 5;
		}
		
		if (spawn_time > 0){
			spawn_time -= spawn_rate;
		}else{
			spawn = true;
			spawn_time = 60 * spawn_interval[global.game_combat_state];
			spawn_time /= spawn_rate;
		}
		
		if (!global.game_combat_in_hordechallenge){
			global.game_combat_state_time_real ++;
		}
	
		if (spawn){
		
			if (scr_enemy_count(false) < spawn_max[global.game_combat_state]){
				var xpos = random_range(camx - 10, camx + camw + 10);
				var ypos = random_range(camy - 10, camy + camh + 10);
				var spawn_trial = 0;
				
				while(collision_rectangle(xpos - 20, ypos - 20, xpos + 20, ypos + 30, obj_p_solid, false, false)) || (collision_line(xpos, ypos, player.x, player.y, obj_p_solid, false, true)) || (point_distance(xpos, ypos, player.x, player.y) < 80) || (place_meeting(xpos, ypos, obj_campfire_0)){
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
					weapon = choose(PawnWeapon.Machete, PawnWeapon.Rake);
				}
				
				var enemy;
				
				if (chance(75)){
					enemy = instance_create(xpos, ypos, obj_enemy_0);
					
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
		if (audio_is_playing(rain)){
			audio_pause_sound(rain);
		}
		
		if (audio_is_playing(spawn_music_main[CombatState.Idle])){
			audio_pause_sound(spawn_music_main[CombatState.Idle]);
		}
		
		if (audio_is_playing(spawn_music_main[CombatState.Buildup])){
			audio_pause_sound(spawn_music_main[CombatState.Buildup]);
		}
		
		if (audio_is_playing(spawn_music_main[CombatState.Climax])){
			audio_pause_sound(spawn_music_main[CombatState.Climax]);
		}
		
		if (global.boss_current != -1){
			var bossmusic = global.boss_music[global.boss_current];
			
			if (bossmusic != noone){
				if (audio_is_playing(bossmusic)){
					audio_pause_sound(bossmusic);
				}
			}
		}
		
		spawn_pause_update = false;
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

global.game_combat_active = true;
scr_level_combatstate_control();
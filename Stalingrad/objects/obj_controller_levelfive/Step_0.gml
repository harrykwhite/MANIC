var player_exists = instance_exists(global.player);
scr_position_view();
sniper_can_spawn = global.game_firstsniper_killed;

if (!global.game_pause){
	
	// Dust
	if (random(5) < 1) part_particles_create(global.ps_front, random_range(camera_get_view_x(view_camera[0]), camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])), random_range(camera_get_view_y(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])), global.pt_dust_0, 1);
	if (random(10) < 1) part_particles_create(global.ps_front, random_range(camera_get_view_x(view_camera[0]), camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])), random_range(camera_get_view_y(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])), global.pt_dust_1, 1);
	
	// Fog
	if (random(2.5) < 1){
		if (part_particles_count(global.pt_smoke_3) < 40){
			part_particles_create(global.ps_front, camera_get_view_x(view_camera[0])+random_range(0, camera_get_view_width(view_camera[0])), camera_get_view_y(view_camera[0])+random_range(0, camera_get_view_height(view_camera[0])), global.pt_smoke_3, 1);
		}
	}
}

// Spawning
var lighting_level; 
lighting_level[CombatState.Climax] = 1;
lighting_level[CombatState.Buildup] = 0.9;
lighting_level[CombatState.Idle] = 0.8;

if (lighting < lighting_level[global.game_combat_state]){
	lighting += 0.004;
}else if (lighting > lighting_level[global.game_combat_state]){
	lighting -= 0.004;
}

global.ambientShadowIntensity = lighting;

if (player_exists){
	var heavygun_spawn_interval = 60 * 2.25;
	var heavygun_spawn_max = 6;
	var spawn_distance = 120;
	var spawn_rate = spawn_rate_real;
	
	if (global.game_combat_active) && (!global.game_pause) && (global.boss_current == -1){
		if ((global.weapon_slot_standalone == PlayerWeapon.MountedMachineGun) || (global.weapon_slot_standalone == PlayerWeapon.MountedMachineGunCart)){
			spawn_rate ++;
		}
		
		if (spawn_time > 0){
			spawn_time -= spawn_rate;
		}else{
			spawn = true;
			
			if (global.weapon_slot_standalone == PlayerWeapon.MountedMachineGun){
				spawn_time = heavygun_spawn_interval;
			}else{
				spawn_time = 60 * spawn_interval[global.game_combat_state];
			}
			
			spawn_time /= spawn_rate;
		}
		
		spawn_state_time_real++;
	
		if (spawn){
			var num;
			
			if (global.weapon_slot_standalone == PlayerWeapon.MountedMachineGun){
				num = heavygun_spawn_interval;
				spawn_distance = 85;
			}else{
				num = spawn_max[global.game_combat_state];
			}
			
			if (scr_enemy_count(false) < num){
				var xpos = random_range(camera_get_view_x(view_camera[0]) - 10, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 10);
				var ypos = random_range(camera_get_view_y(view_camera[0]) - 10, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 10);
				var spawn_trial = 0;
			
				if (random(2) < 1){
					var barrel;
					
					if (instance_exists(obj_barrel_3)){
						barrel = instance_nearest(xpos, ypos, obj_barrel_3);
						xpos = barrel.x + random_range(-50, 50);
						ypos = barrel.y + random_range(-50, 50);
					}
					
					if (instance_exists(obj_barrel_2)){
						barrel = instance_nearest(xpos, ypos, obj_barrel_2);
						xpos = barrel.x + random_range(-50, 50);
						ypos = barrel.y + random_range(-50, 50);
					}
				}
				
				while(collision_rectangle(xpos - 20, ypos - 20, xpos + 20, ypos + 30, obj_p_solid, false, false)) || (collision_line(xpos, ypos, global.player.x, global.player.y, obj_p_solid, false, true)) || (point_distance(xpos, ypos, global.player.x, global.player.y) < 80){
					xpos = random_range(camera_get_view_x(view_camera[0]) - 10, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 10);
					ypos = random_range(camera_get_view_y(view_camera[0]) - 10, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 10);
					spawn_trial++;
				
					if (spawn_trial > 1000){
						spawn_trial = 0;
						exit;
					}
				}
		
				var weapon;
				
				if (room == rm_level_5_02){
					weapon = choose(PawnWeapon.Axe, PawnWeapon.Machete, PawnWeapon.Sledgehammer);
				}else{
					if (chance(85)){
						weapon = choose(PawnWeapon.Axe, PawnWeapon.Machete, PawnWeapon.Sledgehammer);
					}else{
						weapon = choose(PawnWeapon.Grenade);
					}	
				}
				
				var enemy;
				
				if (chance(75)){
					enemy = instance_create(xpos, ypos, obj_enemy_0);
					
					if ((global.weapon_slot_standalone == PlayerWeapon.MountedMachineGun) || (global.weapon_slot_standalone == PlayerWeapon.MountedMachineGunCart)){
						enemy.move_speed_offset = 1.45;
						enemy.attack_time = 45;
						enemy.type = EnemyOneType.Ordinary
					}else{
						if (spawn_rate > 0.9){
							if (chance(15)){
								enemy.type = choose(EnemyOneType.Fast, EnemyOneType.Large);
							}
						
							if (global.boss_current == -1) && (room != rm_level_5_02){
								if (chance(3.5)){
									enemy.type = EnemyOneType.Mother;
								}
							
								if (sniper_can_spawn){
									if (chance(4)){
										enemy.type = EnemyOneType.Sniper;
									}
								}
							}
						}
				
						if (spawn_rate > 1.4){
							if (chance(20)){
								enemy.type = choose(EnemyOneType.Fast, EnemyOneType.Large);
							}
					
							if (global.boss_current == -1) && (room != rm_level_5_02){
								if (chance(4)){
									enemy.type = EnemyOneType.Mother;
								}
						
								if (sniper_can_spawn){
									if (chance(5)){
										enemy.type = EnemyOneType.Sniper;
									}
								}
							}
						}
				
						if (chance(8)){
							enemy.type = EnemyOneType.Crazy;
						}
				
						if (weapon == PawnWeapon.Grenade){
							enemy.type = EnemyOneType.Grenadier;
						}
				
						if (enemy.type == EnemyOneType.Sniper){
							weapon = PawnWeapon.SniperRifle;
						}
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
		
	}else if (global.game_pause ){
		
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
	}
	
}else{
	spawn_state_time_real = 0;
	spawn_rate_real = 0.75;
	global.game_combat_state = CombatState.Idle;
	
	if (global.cutscene_current == -1){
		audio_sound_gain(spawn_music_main[CombatState.Idle], 0, 1000);
		audio_sound_gain(spawn_music_main[CombatState.Buildup], 0, 1000);
		audio_sound_gain(spawn_music_main[CombatState.Climax], 0, 1000);
	}
}

global.game_combat_active = true;
scr_level_music_control();
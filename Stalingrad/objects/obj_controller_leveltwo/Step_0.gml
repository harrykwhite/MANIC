scr_position_view();

if (!global.game_pause){
	
	// Dust
	if (random(4.5) < 1) part_particles_create(global.ps_front, random_range(camera_get_view_x(view_camera[0]), camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])), random_range(camera_get_view_y(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])), global.pt_dust_2, 1);
	if (random(6.5) < 1) part_particles_create(global.ps_front, random_range(camera_get_view_x(view_camera[0]), camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])), random_range(camera_get_view_y(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])), global.pt_dust_0, 1);
	if (random(8.5) < 1) part_particles_create(global.ps_front, random_range(camera_get_view_x(view_camera[0]), camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])), random_range(camera_get_view_y(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])), global.pt_dust_1, 1);

	// Tumbleweed
	if (random(70) < 1){
		if (instance_exists(global.player)){
			var xx = random_range(camera_get_view_x(view_camera[0]), camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]));
			var yy = random_range(camera_get_view_y(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]));
			var safe = 0;
			
			while(point_distance(xx, yy, global.player.x, global.player.y) < 200) || (place_meeting(xx, yy, obj_p_solid)) || (scr_ceiling_at(xx, yy)){
				xx = random_range(camera_get_view_x(view_camera[0]), camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]));
				yy = random_range(camera_get_view_y(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]));
			
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

	// Fog
	if (random(3) < 1){
	    part_particles_create(global.ps_front, camera_get_view_x(view_camera[0])+random_range(0, camera_get_view_width(view_camera[0])), camera_get_view_y(view_camera[0])+random_range(0, camera_get_view_height(view_camera[0])), global.pt_smoke_3, 1);
	}
}

// Spawning
var lighting_level; 
lighting_level[CombatState.Climax] = 1;
lighting_level[CombatState.Buildup] = 0.95;
lighting_level[CombatState.Idle] = 0.9;

if (lighting < lighting_level[global.game_combat_state]){
	lighting += 0.004;
}else if (lighting > lighting_level[global.game_combat_state]){
	lighting -= 0.004;
}

global.ambientShadowIntensity = lighting;

if (instance_exists(global.player)){
	
	scr_game_objective_control();
	var spawn_rate = spawn_rate_real;
	
	if (global.game_combat_active) && (!global.game_pause) && (objective_type[global.game_objective_current] != ObjectiveType.Clear) && (global.boss_current == -1) && (global.cutscene_current == -1){
	
		if (global.weapon_slot_standalone == PlayerWeapon.MountedMachineGun){
			spawn_rate ++;
		}
		
		if (spawn_time > 0){
			spawn_time -= spawn_rate;
		}else{
			spawn = true;
			spawn_time = 60 * spawn_interval[global.game_combat_state];
			spawn_time /= spawn_rate;
		}
		
		spawn_state_time_real++;
	
		if (spawn){
		
			if (scr_enemy_count(false) < spawn_max[global.game_combat_state]){
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
				
				while(collision_rectangle(xpos - 20, ypos - 20, xpos + 20, ypos + 30, obj_p_solid, false, false)) || (collision_line(xpos, ypos, global.player.x, global.player.y, obj_p_solid, false, true)) || (point_distance(xpos, ypos, global.player.x, global.player.y) < 80) || (place_meeting(xpos, ypos, obj_campfire_0)){
					xpos = random_range(camera_get_view_x(view_camera[0]) - 10, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 10);
					ypos = random_range(camera_get_view_y(view_camera[0]) - 10, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 10);
					spawn_trial++;
				
					if (spawn_trial > 1000){
						spawn_trial = 0;
						exit;
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
					
					if (spawn_rate > 1){
						if (chance(20)){
							enemy.type = choose(EnemyOneType.Fast, EnemyOneType.Large);
						}
					}
				
					if (spawn_rate > 1.5){
						if (chance(30)){
							enemy.type = choose(EnemyOneType.Fast, EnemyOneType.Large);
						}
					
						if (global.boss_current == -1){
							if (chance(5)){
								enemy.type = EnemyOneType.Mother;
							}
						}
					}
				
					if (weapon == PawnWeapon.Grenade){
						enemy.type = EnemyOneType.Grenadier;
					}
				
					if (enemy.type == EnemyOneType.Sniper){
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
		
	}else if (global.game_pause == true){
		
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

if (objective_type[global.game_objective_current] == ObjectiveType.Clear){
	if (!spawn_cleared){
		audio_sound_gain(spawn_music_main[CombatState.Idle], 1, 8000);
		audio_sound_gain(spawn_music_main[CombatState.Buildup], 0, 2000);
		audio_sound_gain(spawn_music_main[CombatState.Climax], 0, 2000);
		spawn_cleared = true;
	}
	
	global.game_combat_state = CombatState.Idle;
}

global.game_combat_active = true;
scr_level_music_control();
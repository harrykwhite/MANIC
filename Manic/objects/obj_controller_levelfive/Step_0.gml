var player = obj_player;
var player_exists = instance_exists(player);
scr_position_view();
sniper_can_spawn = global.game_firstsniper_killed;

var camx = camera_get_view_x(view_camera[0]);
var camy = camera_get_view_y(view_camera[0]);
var camw = camera_get_view_width(view_camera[0]);
var camh = camera_get_view_height(view_camera[0]);

if (!global.game_pause){
	
	// Dust
	if (random(5) < 1) part_particles_create(global.ps_front, random_range(camx, camx + camw), random_range(camy, camy + camh), global.pt_dust_0, 1);
	if (random(10) < 1) part_particles_create(global.ps_front, random_range(camx, camx + camw), random_range(camy, camy + camh), global.pt_dust_1, 1);
	
	// Fog
	if (random(2.5) < 1){
		if (part_particles_count(global.pt_fog_0) < 40){
			part_particles_create(global.ps_front, camx + random_range(0, camw), camy + random_range(0, camh), global.pt_fog_0, 1);
		}
	}
}

// Checkpoint
if (room == rm_level_5_02){
	if (global.cutscene_current == -1) && (!global.level_checkpoint_found[global.level_current, 0]){
		obj_controller_gameplay.checkpoint_create = true;
		global.level_checkpoint_found[global.level_current, 0] = true;
	}
}

// Spawning
var lighting_level; 
lighting_level[CombatState.Climax] = 1;
lighting_level[CombatState.Buildup] = 0.95;
lighting_level[CombatState.Idle] = 0.9;

var lighting_to = lighting_level[global.game_combat_state];

if (global.game_combat_in_hordechallenge){
	lighting_to = 1;
}

if (scr_level_is_peaceful(room)){
	lighting_to = 0.925;
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
				
					while(!scr_is_valid_enemyspawn(xpos, ypos)){
						xpos = random_range(camx - 10, camx + camw + 10);
						ypos = random_range(camy - 10, camy + camh + 10);
						spawn_trial ++;
				
						if (spawn_trial > 1000){
							spawn_trial = 0;
							return;
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
							enemy.type = Enemy0_Type.Normal
						
							while(weapon == PawnWeapon.Grenade){
								weapon = choose(PawnWeapon.Axe, PawnWeapon.Machete, PawnWeapon.Sledgehammer);
							}
						}else{
							if (spawn_rate > 0.9){
								if (global.boss_current == -1) && (room != rm_level_5_02){
									if (chance(3.5)){
										enemy.type = Enemy0_Type.Mother;
									}
							
									if (sniper_can_spawn){
										if (chance(4)){
											enemy.type = Enemy0_Type.Sniper;
										}
									}
								}
							}
				
							if (spawn_rate > 1.4){
								if (global.boss_current == -1) && (room != rm_level_5_02){
									if (chance(4)){
										enemy.type = Enemy0_Type.Mother;
									}
						
									if (sniper_can_spawn){
										if (chance(5)){
											enemy.type = Enemy0_Type.Sniper;
										}
									}
								}
							}
				
							if (chance(8)){
								enemy.type = Enemy0_Type.Crazy;
							}
				
							if (weapon == PawnWeapon.Grenade){
								enemy.type = Enemy0_Type.Grenadier;
							}
				
							if (enemy.type == Enemy0_Type.Sniper){
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
		
		}else if (global.game_pause){
			audio_pause_all();
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
}

scr_level_combatstate_control();
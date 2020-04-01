// Flies
var flyvalid = false;

if (object_index != obj_enemy_1) && (object_index != obj_enemy_3) && (object_index != obj_enemy_4) && (object_index != obj_giantturret) && (object_index != obj_giantturret_flamethrower){
	flyvalid = true;
}

if (object_index == obj_enemy_0){
	if (type == Enemy0_Type.Fly){
		flyvalid = false;
	}
}

if (flyvalid){
	var flylength = array_length_1d(fly);
	var docreate = true;
	
	if (docreate){
		if (health_current <= floor(health_max / 3)) || (object_index == obj_enemy_4){
			for(var i = 0; i < flylength; i ++){
				if (fly[i] == noone){
					if (random(150) < 1){
						fly[i] = instance_create(x + random_range(-15, 15), y + random_range(-15, 15), obj_ef_fly);
					}
				
					break;
				}
		
				fly[i].fobject = id;
			}
		}else{
			for(var i = 0; i < flylength; i ++){
				if (instance_exists(fly[i])){
					instance_destroy(fly[i]);
					fly[i] = noone;
				}
			}
		}
	}
}

// Death
var doexplode = false, pack;

if (health_current <= 0){
	var eoffsetx = 12;
	var eoffsety = 18;
	var eamount = 25;
	
	var shake = 3;
	var redtint = 0.2 + (global.game_save_level / 20);
	var freeze = 12;
	var zoom = -0.04;
	
	if (object_index == obj_enemy_1){
		eoffsetx = 4;
		eoffsety = 4;
		eamount = 7;
		
		shake = 1;
		redtint = 0.1 + (global.game_save_level / 50);
		freeze = 15;
		zoom = -0.01;
	}
	
	repeat(eamount){
		part_particles_create(global.ps_front, x + random_range(-eoffsetx, eoffsetx), y + random_range(-eoffsety, eoffsety), global.pt_blood_4, 1);
	}
	
    scr_effect_screenshake(shake);
	scr_effect_redtint_flash(redtint);
	scr_effect_freeze(freeze);
	scr_effect_zoom(zoom);
	
	instance_destroy();
	scr_sound_play_distance_pitch(snd_other_kick_0, false, 500, 0.8, 1.2);
	
	if (mylight != noone){
		instance_destroy(mylight);
	}
	
	if (flyvalid){
		for(var i = 0; i < flylength; i ++){
			if (instance_exists(fly[i])){
				instance_destroy(fly[i]);
				fly[i] = noone;
			}
		}
	}
	
	if (pawn == PawnType.Enemy){
		if (object_index != obj_enemy_1){
			obj_controller_gameplay.bonus_killamount ++;
			obj_controller_gameplay.bonus_killtime = 80;
		}
		
		if (object_index == obj_enemy_0){
			global.game_firstenemy_killed = true;
			scr_level_increase_kill_count();
			
			switch(type){
				case Enemy0_Type.Grenadier:
					global.game_firstgrenadier_killed = true;
					break;
				
				case Enemy0_Type.Crazy:
					global.game_firstcrazy_killed = true;
					break;
				
				case Enemy0_Type.Sniper:
					global.game_firstsniper_killed = true;
					break;
				
				case Enemy0_Type.Healer:
					global.game_firsthealer_killed = true;
					break;
				
				case Enemy0_Type.Fly:
					global.game_firstflyhead_killed = true;
					break;
			}
			
			if (type == Enemy0_Type.Grenadier) || (type == Enemy0_Type.Sniper){
				doexplode = true;
			}
			
			if (type == Enemy0_Type.TrainBoss){
				global.game_boss_trainhorde_killed = true;
				
				if (instance_exists(obj_pawn_other_train_1)){
					obj_pawn_other_train_1.is_boss = false;
				}
				
				obj_controller_ui.bosshealth_value_current = 0;
				
				scr_objective_change(Objectives.BoardTrain, -1, -1);
			}
			
			if (room == rm_level_4_post_00){
				if (instance_number(obj_enemy_0) <= 0){
					if (global.weapon_default == PlayerWeapon.Knife){
						global.cutscene_current = 40;
						
						var bayonet = instance_create(918, 343, obj_weapondrop);
						bayonet.index = PlayerWeapon.Bayonet;
						bayonet.angle = 45;
						
						var cblock = instance_create(880, 315, obj_block_cutscene);
						cblock.image_xscale = 6;
						cblock.image_yscale = 4.3125;
						cblock.index = 59;
						cblock.destroy_on_activate = true;
						cblock.time = 30;
						
						obj_controller_gameplay.cutscene_look_x = bayonet.x;
						obj_controller_gameplay.cutscene_look_y = bayonet.y;
						obj_controller_gameplay.cutscene_look_object = bayonet;
						obj_controller_gameplay.cutscene_look_boss = -1;
						obj_controller_gameplay.cutscene_look_time = 85;
						obj_controller_gameplay.cutscene_look_prop = false;
					}
				}
			}
		}else if (object_index == obj_enemy_2){
			scr_level_increase_kill_count();
			global.game_firstdog_killed = true;
		}else if (object_index == obj_enemy_3){
			scr_level_increase_kill_count();
			global.game_firstturret_killed = true;
			doexplode = true;
			
			global.level_turret_killed[# 0, listnum] = true;
		}else if (object_index == obj_thescorched){
			global.game_boss_thescorched_killed = true;
			
			if (instance_exists(inst_2E30B867)){
				instance_destroy(inst_2E30B867);
			}
			
			if (!scr_player_has_upgrade(PlayerUpgrade.Backpack)){
				var udrop = instance_create(x, y, obj_upgrade_pickup);
				udrop.index = PlayerUpgrade.Backpack;
				udrop.angle = random_range(-10, 10);
				global.cutscene_current = 53;
			}
			
			with(obj_block_cutscene){
				if (index == 11){
					instance_destroy();
				}
			}
		}else if (object_index == obj_thedogkeeper){
			global.game_boss_thedogkeeper_killed = true;
			
			if (instance_exists(inst_12D47517)){
				instance_destroy(inst_12D47517);
			}
			
			if (!scr_player_has_upgrade(PlayerUpgrade.ExplosiveVest)){
				var udrop = instance_create(x, y, obj_upgrade_pickup);
				udrop.index = PlayerUpgrade.ExplosiveVest;
				udrop.angle = random_range(-10, 10);
				global.cutscene_current = 53;
			}
			
			with(obj_block_cutscene){
				if (index == 46){
					instance_destroy();
				}
			}
		}else if (object_index == obj_giantturret){
			doexplode = true;
			
			for(var i = 0; i < 4; i ++){
				if (instance_exists(flamethrower[i])){
					flamethrower[i].health_current = 0;
				}
			}
			
			obj_controller_ui.bosshealth_value_current = 0;
			
			var antag = instance_create(x, y, obj_antagonist);
			antag.arena_x = 292;
			antag.arena_y = 306;
			antag.arena_width = 430;
			antag.arena_height = 276;
			antag.cutscene_prop = true;
			antag.in_cutscene = true;
			
			global.cutscene_current = 40;
			with(obj_controller_gameplay){
				cutscene_look_x = other.x;
				cutscene_look_y = other.y;
				cutscene_look_time = 35;
				cutscene_look_object = antag;
				cutscene_look_prop = true;
				cutscene_look_boss = Boss.Antagonist;
			}
		}else if (object_index == obj_giantturret_flamethrower){
			doexplode = true;
		}else if (object_index == obj_enemy_4){
			scr_level_increase_kill_count();
			global.game_firstmaggot_killed = true;
			
			if (chance(30)){
				pack = instance_create(x + random_range(-4, 4), y + random_range(-4, 4), obj_health_pack_1);
				pack.is_dropped = true;
			}
		}else if (object_index == obj_enemy_5){
			
		}else if (object_index == obj_antagonist){
			global.cutscene_current = 54;
			global.game_boss_final_killed = true;
			
			if (instance_exists(inst_5141CF14)){
				instance_destroy(inst_5141CF14);
			}
			
			ini_open(working_directory + "config.ini");
			ini_write_real("Options", "LevelSelectUnlocked", true);
			global.game_levelselect_unlocked = true;
			ini_close();
			
			obj_controller_gameplay.cutscene_ending_stage = 0;
		}
	}
	
	if (pawn == PawnType.Companion){
		scr_companion_remove(object_index);
		
		if (global.cutscene_current == -1){
			global.cutscene_current = 40;
		
			obj_controller_gameplay.cutscene_look_x = x;
			obj_controller_gameplay.cutscene_look_y = y;
			obj_controller_gameplay.cutscene_look_object = obj_companion_corpse;
			obj_controller_gameplay.cutscene_look_boss = -1;
			obj_controller_gameplay.cutscene_look_time = 85;
			obj_controller_gameplay.cutscene_look_prop = false;
		}
		
		if (object_index == obj_companion_0){
			global.companion_death_time = global.companion_death_time_max;
		}
	}
	
	if (doexplode){
		repeat(9){
			part_particles_create(global.ps_front, x + random_range(-22, 22), y + random_range(-22, 22), global.pt_smoke_2, 1);
		}
	
		repeat(2){
			part_particles_create(global.ps_front, x + random_range(-42, 42), y + random_range(-42, 42), global.pt_smoke_2, 1);
		}
		
		repeat(7){
			part_particles_create(global.ps_bottom, x + random_range(-6, 6), y + random_range(-6, 6), global.pt_ash_0_perm, 1);
		}
    
		part_particles_create(global.ps_front, x, y, global.pt_fire_1, 17);
	
		var fl = instance_create(x, y, obj_block_light);
		fl.mylight[0] = noone; fl.size[0] = 100;
		fl.fadeSpeed = 0.015;
	
		scr_damage_custom(2, 1, 45, 45, 3, true, true, true, true);
		scr_effect_vignette_flash(c_ltgray, 0.4, 0.01);
		scr_effect_screenshake(4);
		scr_effect_freeze(13);
		scr_effect_zoom(-0.1);
		scr_sound_play_distance(snd_weapon_explode_0, false, 600);
		
		if (object_index == obj_giantturret_flamethrower){
			pack = instance_create(x + random_range(-6, 6), y + random_range(3, 5), obj_health_pack_1);
			pack.is_dropped = true;
			
			scr_weapon_ammo_spawn(choose(4, 6), 7, 5, x, y + 2);
		}
	}else{
		scr_sound_play_distance(snd_character_death_0, false, 600);
	}
	
	if (object_index == obj_enemy_0){
	    var dropchance = 40;
	
		if (global.weapon_slot[0] == -1) && (global.weapon_slot[1] == -1){
			dropchance = 100;
		}
	
		if (global.weapon_slot[0] == -1) ^^ (global.weapon_slot[1] == -1){
			dropchance = 70;
		}
	
		if (global.weapon_slot_standalone != -1){
			dropchance = 0;
			return;
		}
	
		if (weapon.type == WeaponType.Ranged){
			dropchance = 20;
		}
	
		if (type == Enemy0_Type.Mother) || (type == Enemy0_Type.Sniper){
			dropchance = 100;
			
			pack = instance_create(x - 7, y + 2, obj_health_pack_0);
			pack.is_dropped = true;
			
			pack = instance_create(x + 9, y + 4, obj_health_pack_0);
			pack.is_dropped = true;
			
			scr_weapon_ammo_spawn(choose(3, 4), 5, 6, x, y + 5);
			global.boss_current = -1;
		}else if (type == Enemy0_Type.TrainBoss){
			dropchance = 100;
			audio_sound_gain(global.boss_music[global.boss_current], 0, 5000);
			audio_play_sound(global.boss_stinger[global.boss_current], 3, false);
			
			pack = instance_create(x, y + 4, obj_health_pack_1);
			pack.is_dropped = true;
			
			obj_controller_ui.bosshealth_value_current = 0;
			
			scr_weapon_ammo_spawn(choose(3, 4), 6, 8, x, y + 4);
			global.boss_current = -1;
		}else{
			if (chance(20)){
				scr_weapon_ammo_spawn(2, 5, 6, x, y + 5);
			}
			
			if (chance(16)){
				pack = instance_create(x + random_range(-3, 3), y + 4 + random_range(-3, 3), obj_health_pack_2);
				pack.is_dropped = true;
			}
		}
		
		if (weapon.index != PawnWeapon.Knife) && (weapon.index != -1){
		    if (chance(dropchance)){
				var xx, yy, angle, ind, w;
				
				if (instance_exists(weapon) && weapon != -1){
					xx = weapon.x;
					yy = weapon.y;
					angle = weapon.image_angle + random_range(-30, 30);
					ind = global.pawnweapon_playerindex[weapon_index];
					
					if (ind == PlayerWeapon.Grenade){
						if (random(2.5) < 1) && (global.level_current >= Level.TrainStation){
							ind = PlayerWeapon.LandMine;
						}
					}
					
					w = instance_create(xx, yy, obj_weapondrop);
					w.angle = angle;
					w.index = ind;
					w.drop = true;
					w.spd = random_range(1.5, 2.5);
					w.dir = random(360);
					
					if (ind == PlayerWeapon.Grenade) || (ind == PlayerWeapon.LandMine){
						w.pack = true;
						w.angle = 0;
						w.quantity = choose(2, 3);
					}
				}
			}
		}
	}else if (object_index == obj_thescorched) || (object_index == obj_thedogkeeper) || (object_index == obj_antagonist){
		if (object_index != obj_antagonist){
			audio_sound_gain(global.boss_music[global.boss_current], 0, 5000);
			audio_play_sound(global.boss_stinger[global.boss_current], 3, false);
			
			pack = instance_create(x, y + 4, obj_health_pack_1);
			pack.is_dropped = true;
			
			scr_weapon_ammo_spawn(choose(7, 8), 6, 8, x, y + 4);
		}
		
		obj_controller_ui.bosshealth_value_current = 0;
		
		global.boss_current = -1;
	}
}
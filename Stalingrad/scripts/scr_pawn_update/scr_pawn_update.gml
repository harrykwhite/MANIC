// Knockback
var kbs = knockback_speed * knockback_resist;

if (kbs > 0.1) && (!place_meeting(x + lengthdir_x(kbs + 1, knockback_direction), y + lengthdir_y(kbs + 1, knockback_direction), obj_p_solid)){
    x += lengthdir_x(kbs, knockback_direction);
    y += lengthdir_y(kbs, knockback_direction);
    
    knockback_speed *= 0.9;
}else{
    knockback_speed = 0;
}

// Invincibility
if (i_time > 0){
    i_time--;
}else{
    i_time = 0;
}

if (i_blend_time > 0){
    i_blend_time--;
}else{
    blend = -1;
}

// Flies
if (object_index == obj_enemy_0){
	var length = array_length_1d(fly);

	if (health_current <= floor(health_max / 3)){
		for(var i = 0; i < length; i++){
			if (fly[i] == noone){
				if (random(100) <= 1) fly[i] = instance_create(x + random_range(-15, 15), y + random_range(-15, 15), obj_ef_fly);
				break;
			}
		
			fly[i].xbase = x;
			fly[i].ybase = y;
		}
	}
}

// Death
var doexplode = false;

if (health_current <= 0){
	var eoffsetx = 12;
	var eoffsety = 18;
	var eamount = 25;
	
	if (object_index == obj_enemy_1){
		eoffsetx = 4;
		eoffsety = 4;
		eamount = 7;
	}
	
	repeat(eamount){
		part_particles_create(global.ps_front, x + random_range(-eoffsetx, eoffsetx), y + random_range(-eoffsety, eoffsety), global.pt_blood_4, 1);
	}
	
    scr_effect_freeze(5);
    scr_effect_screenshake(4);
	scr_effect_vignette_flash(c_white, 0.3, 0.02);
	scr_effect_grain(0.4);
    
    instance_destroy();
	audio_play_sound(snd_other_kick_0, 3, false);
	
	if (mylight != noone){
		instance_destroy(mylight);
	}
	
	if (pawn == PawnType.Enemy){
		if (object_index != obj_enemy_1){
			if (instance_exists(obj_controller_gameplay)){
				obj_controller_gameplay.bonus_killamount++;
				obj_controller_gameplay.bonus_killtime = 80;
			}
		}
		
		if (object_index == obj_enemy_0){
			switch(type){
				case EnemyOneType.Grenadier:
					global.game_firstgrenadier_killed = true;
					break;
				
				case EnemyOneType.Crazy:
					global.game_firstcrazy_killed = true;
					break;
				
				case EnemyOneType.Sniper:
					global.game_firstsniper_killed = true;
					break;
				
				case EnemyOneType.Healer:
					global.game_firsthealer_killed = true;
					break;
				
				case EnemyOneType.Fly:
					global.game_firstflyhead_killed = true;
					break;
			}
			
			if (type == EnemyOneType.Grenadier) || (type == EnemyOneType.Sniper){
				doexplode = true;
			}
			
			if (type == EnemyOneType.TrainBoss){
				global.game_boss_trainhorde_killed = true;
				obj_pawn_other_train_1.is_boss = false;
			}
		}else if (object_index == obj_enemy_2){
			global.game_firstdog_killed = true;
		}else if (object_index == obj_enemy_3){
			doexplode = true;
			global.game_firstturret_killed = true;
		}else if (object_index == obj_thescorched){
			global.game_boss_thescorched_killed = true;
			with(obj_block_cutscene){
				if (index == 11){
					instance_destroy();
				}
			}
		}else if (object_index == obj_thedogkeeper){
			global.game_boss_thedogkeeper_killed = true;
			with(obj_block_cutscene){
				if (index == 46){
					instance_destroy();
				}
			}
		}else if (object_index == obj_giantturret) || (obj_giantturret_flamethrower){
			doexplode = true;
		}
	}
	
	if (pawn == PawnType.Companion){
		global.cutscene_current = 40;
		obj_controller_gameplay.cutscene_look_x = x;
		obj_controller_gameplay.cutscene_look_y = y;
		obj_controller_gameplay.cutscene_look_object = obj_companion_corpse;
		obj_controller_gameplay.cutscene_look_boss = -1;
		obj_controller_gameplay.cutscene_look_time = 60;
		obj_controller_gameplay.cutscene_look_prop = false;
	}
	
	if (doexplode){
		repeat(9){
			part_particles_create(global.ps_front, x + random_range(-22, 22), y + random_range(-22, 22), global.pt_smoke_2, 1);
		}
	
		repeat(2){
			part_particles_create(global.ps_front, x + random_range(-42, 42), y + random_range(-42, 42), global.pt_smoke_2, 1);
		}
    
		part_particles_create(global.ps_front, x, y, global.pt_fire_1, 17);
	
		var fl = instance_create(x, y, obj_block_light);
		fl.mylight[0] = noone; fl.size[0] = 100;
		fl.fadeSpeed = 0.015;
	
		scr_damage_custom(2, 1, 45, 45, 3, true, true, true, true);
		scr_damage_custom(1, 1, 55, 55, 3, true, true, true, true);
		scr_effect_vignette_flash(c_white, 0.4, 0.02);
		scr_effect_screenshake(5);
		scr_sound_play_distance(snd_weapon_explode_0, false, 600);
		
		if (object_index == obj_giantturret_flamethrower){
			instance_create(x + random_range(-6, 6), y + random_range(3, 5), obj_health_pack_1);
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
			exit;
		}
	
		if (weapon.type == WeaponType.Ranged){
			dropchance = 20;
		}
	
		if (type == EnemyOneType.Mother) || (type == EnemyOneType.Sniper){
			dropchance = 100;
			instance_create(x - 7, y + 2, obj_health_pack_0);
			instance_create(x + 9, y + 4, obj_health_pack_0);
			scr_weapon_ammo_spawn(choose(6, 7), 5, 6, x, y + 5);
		}else if (type == EnemyOneType.TrainBoss){
			dropchance = 100;
			audio_sound_gain(global.boss_music[global.boss_current], 0, 5000);
			audio_play_sound(global.boss_stinger[global.boss_current], 3, false);
			instance_create(x, y + 4, obj_health_pack_1);
			scr_weapon_ammo_spawn(choose(7, 8), 6, 8, x, y + 4);
			global.boss_current = -1;
		}else{
			if (chance(29)){
				scr_weapon_ammo_spawn(choose(2, 4), 5, 6, x, y + 5);
			}
		}
	
		if (weapon.index != PawnWeapon.Knife) && (weapon.index != -1){
		    if (chance(dropchance)){
				var xx, yy, angle, ind, w;
			
				if (instance_exists(weapon)){
					xx = weapon.x;
					yy = weapon.y;
					angle = weapon.image_angle + random_range(-30, 30);
					ind = global.pawnweapon_realindex[weapon_index];
				
					if (ind == PlayerWeapon.Grenade){
						if (random(2.5) < 1) && (global.level_current >= 5){
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
	}else if (object_index == obj_thescorched) || (object_index == obj_thedogkeeper){
		audio_sound_gain(global.boss_music[global.boss_current], 0, 5000);
		audio_play_sound(global.boss_stinger[global.boss_current], 3, false);
		instance_create(x, y + 4, obj_health_pack_1);
		scr_weapon_ammo_spawn(choose(7, 8), 6, 8, x, y + 4);
		global.boss_current = -1;
	}
}
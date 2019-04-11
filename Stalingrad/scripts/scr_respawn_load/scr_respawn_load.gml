global.game_combat_state = CombatState.Idle;
global.weapon_slot_standalone = -1;
scr_weapon_list();
var level = scr_get_level_object();

if (instance_exists(obj_pawn_other_train_0)){
	instance_destroy(obj_pawn_other_train_0);
}

if (global.boss_current != -1){
	var music = global.boss_music[global.boss_current];
	
	if (music != noone){
		if (audio_is_playing(music)){
			audio_sound_gain(music, 0, 1200);
		}
	}
}

global.player_health_current = global.player_health_max;
global.weapon_slotcurrent = 0;

instance_destroy(obj_player_light);
instance_destroy(obj_player_flashlight);

if (!global.player_has_bossrespawn){
	var roomto = global.level_room[global.level_current];
	
	if (roomto == room){
		room_restart();
		if (global.worldShadowMap != undefined){
			surface_free(global.worldShadowMap);
		}
	}else{
		room_goto(roomto);
	}
}else{
	with(obj_block_persistent){
		activate = true;
	}

	if (!instance_exists(obj_player)){
		instance_create(0, 0, obj_player);
	}

	obj_player.x = global.player_respawn_x;
	obj_player.y = global.player_respawn_y;

	var safe = instance_create(obj_player.x, obj_player.y, obj_block_safezone);
	safe.image_xscale = 4;
	safe.image_yscale = 4;
	safe.x -= (safe.sprite_width * 0.5);
	safe.y -= (safe.sprite_height * 0.5);

	for(var i = 0; i < 2; i ++){
		if (room == rm_level_10_01){
			global.weapon_slot[i] = obj_controller_levelten.weaponstart[i];
			global.weapon_slotammo[i] = obj_controller_levelten.weaponstart_ammo[i];
		
			if (global.weapon_type[obj_controller_levelten.weaponstart[i]] == WeaponType.Throwing){
				global.weapon_quantity[obj_controller_levelten.weaponstart[i]] = obj_controller_levelten.weaponstart_quantity[i];
			}
		}else{
			if (i == 0){
				global.weapon_slot[i] = PlayerWeapon.Revolver;
			}else{
				global.weapon_slot[i] = -1;
			}
		}
	}

	if (global.weapon_slot[global.weapon_slotcurrent] != -1){
		var weapon = global.weapon_object[global.weapon_slot[global.weapon_slotcurrent]];
	
		if (!instance_exists(weapon)){
			instance_create(obj_player.x, obj_player.y, weapon);
		}
	}

	// Camera
	obj_controller_camera.x = obj_player.x;
	obj_controller_camera.y = obj_player.y;
	obj_controller_camera.camera_screenshake = false;
	obj_controller_camera.camera_screenshake_amount = 0;

	// Other
	instance_activate_all();
	scr_enemy_destroy_all();
	scr_cutscene_block_restart_all();
	scr_weapondrop_destroy_all();

	var height = ds_grid_height(global.player_companions);
	for(var i = 0; i < height; i ++){
		if (global.player_companions[# 0, i] != -1){
			var obj = global.companion[global.player_companions[# 0, i]];
			if (instance_exists(obj)){
				instance_destroy(obj);
			}
	
			var comp = instance_create(obj_player.x, obj_player.y, obj);
			if (global.player_companions[# 1, i] != -1){
				comp.health_current = global.player_companions[# 1, i];
			}
		}
	}

	if (instance_exists(obj_pawn_other_train_1)){
		if (obj_pawn_other_train_1.is_boss) && (room == rm_level_6_00){
			instance_destroy(obj_pawn_other_train_1);
			level.trainboss_time = 0;
			level.trainboss_trainhead = noone;
			level.trainboss_leader = noone;
			level.trainboss_spawned = false;
		}
	}

	if (audio_is_playing(snd_character_burn_0)){
		audio_stop_sound(snd_character_burn_0);
	}

	if (audio_is_playing(snd_weapon_flamethrower_active_0)){
		audio_stop_sound(snd_weapon_flamethrower_active_0);
	}

	obj_controller_gameplay.deactivate_time = 0;
	obj_controller_ui.bosshealth_value_current = 0;
	obj_controller_ui.bosshealth_value_max = 0;
	obj_controller_ui.bosshealth_width_current = -10;
}
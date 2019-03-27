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

with(obj_block_persistent){
	activate = true;
}

if (!instance_exists(obj_player)){
	instance_create(0, 0, obj_player);
}

ini_open("save_respawn.ini");
obj_player.x = global.player_respawn_x;
obj_player.y = global.player_respawn_y;
ini_close();

var safe = instance_create(obj_player.x, obj_player.y, obj_block_safezone);
safe.image_xscale = 4;
safe.image_yscale = 4;
safe.x -= (safe.sprite_width * 0.5);
safe.y -= (safe.sprite_height * 0.5);

global.player_healthCurrent = global.player_healthMax;

global.weapon_slotcurrent = 0;
global.weapon_slot[0] = PlayerWeapon.Revolver;
global.weapon_slot[1] = -1;

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

if (global.player_companion != -1){
	instance_destroy(global.companion[global.player_companion]);
	var comp = instance_create(obj_player.x - 24, obj_player.y, global.companion[global.player_companion]);
	if (global.player_companion_health != -1){
		comp.health_current = global.player_companion_health;
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
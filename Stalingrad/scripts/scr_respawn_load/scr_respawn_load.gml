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

with(level){
	if (objective_type[global.game_objective_current] == ObjectiveType.Kill){
		objective_type_kill_number[global.game_objective_current] += 3;
		objective_type_kill_number[global.game_objective_current] = clamp(objective_type_kill_number[global.game_objective_current], 0, objective_type_kill_number_max[global.game_objective_current]);
		
		if (global.level_current == 0){
			objective_title[global.game_objective_current] = "Kill remaining " + string(objective_type_kill_number[global.game_objective_current]) + " enemies";
		}else{
			objective_title[global.game_objective_current] = "Clear the area of " + string(objective_type_kill_number[global.game_objective_current]) + " enemies";
		}
		
		if (room == rm_level_5_02) && (global.game_objective_current == 1){
			objective_type_kill_number[global.game_objective_current] = objective_type_kill_number_max[global.game_objective_current];
			global.game_objective_current = 0;
		}
		
		obj_controller_ui.objective_text_set = false;
		scr_game_objective_ui_update();
	}
	
	if (global.level_current == 1){
		if (global.game_objective_current == 1){
			global.game_objective_current = 0;
			obj_controller_ui.objective_text_set = false;
		}
	}
	
	if (global.level_current == 5){
		if (global.game_objective_current == 1){
			global.game_objective_current = 0;
			objective_type_kill_number[global.game_objective_current] = 3;
			objective_title[global.game_objective_current] = "Clear the area of " + string(objective_type_kill_number[global.game_objective_current]) + " enemies";
			obj_controller_ui.objective_text_set = false;
			scr_game_objective_ui_update();
		}
	}
}

if (!instance_exists(obj_player)){
	instance_create(0, 0, obj_player);
	global.player = obj_player;
}

ini_open("save_respawn.ini");
global.player.x = global.player_respawn_x;
global.player.y = global.player_respawn_y;
ini_close();

var safe = instance_create(global.player.x, global.player.y, obj_block_safezone);
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
		instance_create(global.player.x, global.player.y, weapon);
	}
}

// Camera
if (instance_exists(obj_controller_camera)){
	obj_controller_camera.x = global.player.x;
	obj_controller_camera.y = global.player.y;
	obj_controller_camera.camera_screenshake = false;
	obj_controller_camera.camera_screenshake_amount = 0;
}

// Other
scr_enemy_destroy_all();
scr_cutscene_block_restart_all();
scr_weapondrop_destroy_all();

if (global.player_companion != -1){
	instance_destroy(global.companion[global.player_companion]);
	var comp = instance_create(global.player.x - 24, global.player.y, global.companion[global.player_companion]);
	if (global.player_companion_health != -1){
		comp.health_current = global.player_companion_health;
	}
}

if (audio_is_playing(snd_character_burn_0)){
	audio_stop_sound(snd_character_burn_0);
}

if (audio_is_playing(snd_weapon_flamethrower_active_0)){
	audio_stop_sound(snd_weapon_flamethrower_active_0);
}

obj_controller_gameplay.deactivate_time = 0;
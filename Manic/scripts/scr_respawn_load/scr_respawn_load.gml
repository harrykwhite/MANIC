var changed = false;

global.game_combat_state = CombatState.Idle;
global.game_combat_arena_wave = 0;

global.weapon_slot_standalone = -1;

scr_weapon_list();

if (global.level_current == Level.Prologue){
	global.weapon_slot[0] = -1;
	global.weapon_slotammo[0] = -1;
	global.weapon_slotscale[0] = 1;
}

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

global.boss_current = -1;

if (room == rm_level_10_01){
	if (instance_exists(obj_weapon_29)){
		obj_weapon_29.ammo = -1;
		obj_weapon_29.ammostart = 37;
	}
}

if (global.player_is_respawning) && (global.checkpoint_room == noone){
	var roomto = global.level_room[global.level_current];
	
	if (room == global.level_preroom[global.level_current]){
		roomto = global.level_preroom[global.level_current];
	}
	
	global.game_level_opening_type = 0;
	
	changed = true;
	
	if (roomto == room){
		room_restart();
	}else{
		room_goto(roomto);
	}
}else{
	changed = true;
	
	if (global.checkpoint_room == room){
		room_restart();
	}else{
		room_goto(global.checkpoint_room);
	}
	
	/*global.weapon_slot[0] = PlayerWeapon.Revolver;
	global.weapon_slotammo[0] = global.weapon_ammomax[PlayerWeapon.Revolver];
	global.weapon_slotquantity[0] = -1;
	
	var slotcount = global.weapon_slotmax;
	for(var i = 1; i < slotcount; i ++){
		global.weapon_slot[i] = -1;
		global.weapon_slotammo[i] = -1;
		global.weapon_slotquantity[i] = -1;
	}*/
	
	global.checkpoint_goto = true;
	global.game_level_opening_type = global.checkpoint_starttype;
}

if (changed){
	scr_enemy_destroy_all();
	
	with(obj_block_persistent){
		activate = true;
	}
}
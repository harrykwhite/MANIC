global.game_combat_state = CombatState.Idle;
global.weapon_slot_standalone = -1;
scr_weapon_list();

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

if (!global.player_has_bossrespawn) && (global.player_is_respawning){
	var roomto = global.level_room[global.level_current];
	
	if (!global.level_cleared[global.level_current]){
		global.level_kill_count[global.level_current] = 0;
	}
	
	if (roomto == room){
		room_restart();
	}else{
		room_goto(roomto);
	}
}else{
	room_restart();
}
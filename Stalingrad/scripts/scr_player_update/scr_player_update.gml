// Equipment
global.player_weapon = global.weapon_slot[global.weapon_slotcurrent];
var weapon;

if (global.player_weapon != -1){
    weapon = global.weapon_object[global.player_weapon];
    
    if (!instance_exists(weapon)){
        instance_create(x, y, weapon);
    }
}else{
	global.weapon_slot[global.weapon_slotcurrent] = 4;
	
    if (!instance_exists(global.weapon_object[4])){
        instance_create(x, y, global.weapon_object[4]);
    }
}

while(!instance_exists(obj_player_arm)){
    instance_create(x, y, obj_player_arm);
}

// Confining the player to the room.
if (global.cutscene_current == -1){
	x = clamp(x, 0, room_width);
	y = clamp(y, 0, room_height);
}

// Companions
var height = ds_grid_height(global.player_companions);
for(var i = 0; i < height; i ++){
	var obj = global.player_companions[# 0, i];
	
	if (obj != -1){
		if (!instance_exists(obj)){
			global.player_companions[# 0, i] = -1;
			global.player_companions[# 1, i] = -1;
			ds_grid_sort(global.player_companions, 0, false);
		}
	}
}

// Invincibility
if (i_time > 0){
    i_time--;
}else{
    i_time = 0;
}

// Upgrades
global.weapon_slotmax = 2;
if (scr_player_has_upgrade(PlayerUpgrade.Backpack)){
	global.weapon_slotmax = 3;
}

if (global.weapon_slotmax == 2){
	var realslotcount = array_length_1d(global.weapon_slot);
	
	for(var i = 3; i < realslotcount; i ++){
		if (global.weapon_slot[i] != -1){
			global.weapon_slot[i] = -1;
			global.weapon_slotammo[i] = -1;
			global.weapon_slotscale[i] = 1;
		}
	}
}

if (global.weapon_slotcurrent > global.weapon_slotmax - 1){
	with(obj_controller_gameplay){
		scr_weapon_switch(true, 0);
	}
}

global.player_health_max = 6;
if (scr_player_has_upgrade(PlayerUpgrade.Chestplate)){
	global.player_health_max = 12;
}

// Burn
if (burn){
	if (burn_time == -1){
		burn_time = 70;
		burn_cycle_amount = 2;
		burn_sound = scr_sound_play(snd_character_burn_0, true, 1, 1);
	}
	
	scr_sound_set_distance(burn_sound, 110);
	
	if (burn_time > 0){
		burn_time--;
	}else{
		if (burn_cycle_amount > 0){
			burn_cycle_amount--;
			burn_time = 70;
			
			if (global.player_health_current > 1){
				scr_player_damage(1, 0, 0, 5);
				scr_sound_play(choose(snd_character_hit_0, snd_character_hit_1), false, 0.8, 1.2);
			}
		}else{
			scr_draw_burn_die(6, 18, x, y, 5);
			burn_time = -1;
			burn = false;
			audio_stop_sound(burn_sound);
			burn_sound = noone;
		}
	}
}

// Poison
if (poison){
	if (poison_time > 0){
		poison_time--;
	}else{
		if (poison_time == -1){
			poison_time = 140;
			poison_cycle_amount = 4;
		}
		
		if (poison_cycle_amount > 0){
			poison_time = 120;
			poison_cycle_amount --;
			scr_player_damage(1, 0, 0, 5);
			scr_sound_play(choose(snd_character_hit_0, snd_character_hit_1), false, 0.8, 1.2);
		}else{
			scr_draw_poison_die(6, 18, x, y, 5);
			poison_time = -1;
			poison = false;
		}
	}
}

// Flies
var length = array_length_1d(fly);

if (global.player_health_current < 3){
	for(var i = 0; i < length; i ++){
		if (fly[i] == noone){
			if (random(100) <= 0.05) fly[i] = instance_create(x + random_range(-15, 15), y + random_range(-15, 15), obj_ef_fly);
			break;
		}
		
		fly[i].xbase = x;
		fly[i].ybase = y;
	}
}

// Heartbeat
if (global.player_health_current <= 2){
	var vol = 0.7;
	if (!audio_is_playing(snd_other_heartbeat_0)){
		heartbeat = audio_play_sound(snd_other_heartbeat_0, 3, true);
	}
	
	if (global.player_health_current == 1){
		vol = 1;
	}
	
	audio_sound_gain(heartbeat, vol, 2000);
}else{
	if (audio_is_playing(snd_other_heartbeat_0)){
		audio_sound_gain(snd_other_heartbeat_0, 0, 1000);
		
		if (audio_sound_get_gain(snd_other_heartbeat_0) <= 0){
			audio_stop_sound(snd_other_heartbeat_0);
		}
	}
}

// Death
if (global.player_health_current <= 0){
    scr_effect_blackbar();
    scr_effect_flash_script(0.0045, 1, c_black, scr_trigger_0);
	audio_play_sound(m_combat_stinger_3, 3, false);
    
	if (global.game_combat_in_hordechallenge){
		global.game_combat_in_hordechallenge = false;
		global.game_combat_in_hordechallenge_time = 0;
		global.game_combat_state = CombatState.Idle;
		
		audio_sound_gain(spawn_music_main[CombatState.Idle], 0, 0);
		audio_sound_gain(spawn_music_main[CombatState.Idle], 1 * obj_controller_all.real_music_volume, 8000);
		audio_sound_gain(spawn_music_main[CombatState.Buildup], 0, 2000);
		audio_sound_gain(spawn_music_main[CombatState.Climax], 0, 2000);
		
		audio_sound_gain(global.boss_music[0], 0, 5000);
		audio_play_sound(global.boss_stinger[0], 3, false);
	}
	
	global.player_is_respawning = true;
	global.cutscene_current = -1;
	global.game_score_deaths -= 1000;
    instance_destroy();
}
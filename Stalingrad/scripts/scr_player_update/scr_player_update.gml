// Equipment
global.player_weapon = global.weapon_slot[global.weapon_slotcurrent];
var weapon;

if (global.player_weapon != -1){
    weapon = global.weapon_object[global.player_weapon];
    
    if (!instance_exists(weapon)){
        var obj = instance_create(x, y, weapon);
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

// Invincibility
if (i_time > 0){
    i_time--;
}else{
    i_time = 0;
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
			
			if (global.player_healthCurrent > 1){
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

if (global.player_healthCurrent < 3){
	
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
if (global.player_healthCurrent <= 2){
	var vol = 0.7;
	if (!audio_is_playing(snd_other_heartbeat_0)){
		heartbeat = audio_play_sound(snd_other_heartbeat_0, 3, true);
	}
	
	if (global.player_healthCurrent == 1){
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
if (global.player_healthCurrent <= 0){
    scr_effect_blackbar();
    scr_effect_flash_script(0.0075, 1, c_black, scr_trigger_0);
	scr_sound_play(m_combat_stinger_3, false, 1, 1);
    
	global.cutscene_current = -1;
	global.game_score_deaths -= 1000;
    instance_destroy();
}
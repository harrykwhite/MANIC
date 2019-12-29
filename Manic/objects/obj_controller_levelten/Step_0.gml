scr_position_view();

var camx = camera_get_view_x(view_camera[0]);
var camy = camera_get_view_y(view_camera[0]);
var camw = camera_get_view_width(view_camera[0]);
var camh = camera_get_view_height(view_camera[0]);

if (!global.game_pause){
	
	// Dust
	if (random(2) < 1) part_particles_create(global.ps_front, random_range(camx, camx + camw), random_range(camy, camy + camh), global.pt_dust_3, 1);
	if (random(4) < 1) part_particles_create(global.ps_front, random_range(camx, camx + camw), random_range(camy, camy + camh), global.pt_dust_1, 1);
	
	// Fog
	if (random(2) < 1){
		if (part_particles_count(global.pt_fog_0) < 40){
			part_particles_create(global.ps_front, camx + random_range(0, camw), camy + random_range(0, camh), global.pt_fog_0, 1);
		}
	}
}

// Spawning
var lighting = 0.95;
global.game_lighting_level_to = lighting + scr_brightness_offset();

// Final boss music
if (!boss_music_active){
	boss_music_active = (room == rm_level_10_01) && (global.boss_current != -1);
}

if (boss_music_active) && (instance_exists(obj_player)){
	var boss_inst = noone;
	var boss_secondlayer_vol = -1;
	
	if (instance_exists(obj_giantturret)){
		boss_inst = obj_giantturret.id;
	}else if (instance_exists(obj_antagonist)){
		boss_inst = obj_antagonist.id;
	}
	
	if (boss_inst != noone){
		boss_secondlayer_vol = 1 - (boss_inst.health_current / (boss_inst.health_max * 0.5));
		boss_secondlayer_vol += 0.25;
		
		boss_secondlayer_vol = clamp(boss_secondlayer_vol, 0, 1);
	}
	
	if (boss_music_state == "opening"){
		var intro_position;
		
		if (!boss_music_state_started){
			if (!audio_is_playing(m_boss_final_intro_0)){
				boss_music_opening_instance = audio_play_sound(m_boss_final_intro_0, 3, false);
				audio_sound_gain(boss_music_opening_instance, 1 * obj_controller_all.real_music_volume, 0);
			}
			
			boss_music_state_started = true;
		}
		
		intro_position = audio_sound_get_track_position(boss_music_opening_instance);
		
		if (intro_position >= 9.55){
			boss_music_state = "stage 1";
			boss_music_state_started = false;
		}
	}
	
	if (boss_music_state == "stage 1"){
		if (!boss_music_state_started){
			audio_stop_sound(m_boss_final_loop1_layer1_0);
			audio_stop_sound(m_boss_final_loop1_layer2_0);
			
			boss_music_stage1_layer1_instance = audio_play_sound(m_boss_final_loop1_layer1_0, 3, true);
			boss_music_stage1_layer2_instance = audio_play_sound(m_boss_final_loop1_layer2_0, 3, true);
			
			audio_sound_gain(boss_music_stage1_layer1_instance, 1 * obj_controller_all.real_music_volume, 0);
			audio_sound_gain(boss_music_stage1_layer2_instance, 0, 0);
			
			boss_music_state_started = true;
		}
		
		if (boss_inst != noone){
			if (boss_inst.object_index == obj_giantturret){
				audio_sound_gain(boss_music_stage1_layer2_instance, boss_secondlayer_vol * obj_controller_all.real_music_volume, 0);
			}else{
				boss_music_state = "stage 1 transition";
				boss_music_state_started = false;
			}
		}
	}
	
	if (boss_music_state == "stage 1 transition"){
		var transition_position;
		
		if (!boss_music_state_started){
			boss_music_transition_instance = audio_play_sound(m_boss_final_transition_0, 3, false);
			
			audio_sound_gain(boss_music_transition_instance, 1 * obj_controller_all.real_music_volume, 0);
			
			audio_sound_gain(boss_music_stage1_layer1_instance, 0, 5000);
			audio_sound_gain(boss_music_stage1_layer2_instance, 0, 5000);
			
			boss_music_state_started = true;
		}
		
		transition_position = audio_sound_get_track_position(boss_music_transition_instance);
		
		if (transition_position >= 4.35){
			boss_music_state = "stage 2";
			boss_music_state_started = false;
		}
	}
	
	if (boss_music_state == "stage 2"){
		if (!boss_music_state_started){
			audio_stop_sound(m_boss_final_loop2_layer1_0);
			audio_stop_sound(m_boss_final_loop2_layer2_0);
			
			boss_music_stage2_layer1_instance = audio_play_sound(m_boss_final_loop2_layer1_0, 3, true);
			boss_music_stage2_layer2_instance = audio_play_sound(m_boss_final_loop2_layer2_0, 3, true);
			
			audio_sound_gain(boss_music_stage2_layer1_instance, 1 * obj_controller_all.real_music_volume, 0);
			audio_sound_gain(boss_music_stage2_layer2_instance, 0, 0);
			
			boss_music_state_started = true;
		}
		
		if (boss_inst != noone){
			if (boss_inst.object_index == obj_antagonist){
				audio_sound_gain(boss_music_stage2_layer2_instance, boss_secondlayer_vol * obj_controller_all.real_music_volume, 0);
			}
		}else{
			boss_music_state = "outro";
			boss_music_state_started = false;
		}
	}
	
	if (boss_music_state == "outro"){
		if (!boss_music_state_started){
			boss_music_outro_instance = audio_play_sound(m_boss_final_outro_0, 3, false);
			
			audio_sound_gain(boss_music_outro_instance, 1 * obj_controller_all.real_music_volume, 0);
			
			audio_sound_gain(boss_music_stage2_layer1_instance, 0, 3000);
			audio_sound_gain(boss_music_stage2_layer2_instance, 0, 3000);
			
			boss_music_state_started = true;
		}
		
		boss_music_active = false;
		
		boss_music_state = "opening";
		boss_music_state_started = false;
		
		boss_music_opening_instance = noone;
		boss_music_stage1_layer1_instance = noone;
		boss_music_stage1_layer2_instance = noone;
		boss_music_stage2_layer1_instance = noone;
		boss_music_stage2_layer2_instance = noone;
		boss_music_outro_instance = noone;
	}
}else{
	var fadeout_speed = 2500;
	
	if (audio_is_playing(boss_music_opening_instance)){
		audio_sound_gain(boss_music_opening_instance, 0, fadeout_speed);
	}
	
	if (audio_is_playing(boss_music_stage1_layer1_instance)){
		audio_sound_gain(boss_music_stage1_layer1_instance, 0, fadeout_speed);
	}
	
	if (audio_is_playing(boss_music_stage1_layer2_instance)){
		audio_sound_gain(boss_music_stage1_layer2_instance, 0, fadeout_speed);
	}
	
	if (audio_is_playing(boss_music_stage2_layer1_instance)){
		audio_sound_gain(boss_music_stage2_layer1_instance, 0, fadeout_speed);
	}
	
	if (audio_is_playing(boss_music_stage2_layer2_instance)){
		audio_sound_gain(boss_music_stage2_layer2_instance, 0, fadeout_speed);
	}
	
	if (audio_is_playing(boss_music_outro_instance)){
		audio_sound_gain(boss_music_outro_instance, 0, fadeout_speed);
	}
}

scr_level_audio_pause_and_resume();
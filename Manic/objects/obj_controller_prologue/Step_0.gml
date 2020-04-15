scr_position_view();

var camx = camera_get_view_x(view_camera[0]);
var camy = camera_get_view_y(view_camera[0]);
var camw = camera_get_view_width(view_camera[0]);
var camh = camera_get_view_height(view_camera[0]);

if (!global.game_pause){
	
	// Dust
	if (random(6) < 1) part_particles_create(global.ps_front, random_range(camx, camx + camw), random_range(camy, camy + camh), global.pt_dust_3, 1);
	if (random(8) < 1) part_particles_create(global.ps_front, random_range(camx, camx + camw), random_range(camy, camy + camh), global.pt_dust_1, 1);
	
	// Fog
	if (random(4) < 1){
		if (part_particles_count(global.pt_fog_0) < 40){
			part_particles_create(global.ps_front, camx + random_range(0, camw), camy + random_range(0, camh), global.pt_fog_0, 1);
		}
	}
}

// Ambience
if (!global.game_pause){
	if (!audio_is_playing(m_ambience_wind_0)) || (audio_sound_get_gain(m_ambience_wind_0) < 0.01){
		if (!audio_is_playing(m_ambience_wind_0)) audio_play_sound(m_ambience_wind_0, 3, true);
		audio_sound_gain(m_ambience_wind_0, 0.01, 0);
		audio_sound_gain(m_ambience_wind_0, windvolume * obj_controller_all.real_ambience_volume, 15000);
	}
	
	if (!audio_is_playing(m_ambience_birds_0)) || (audio_sound_get_gain(m_ambience_birds_0) < 0.01){
		if (!audio_is_playing(m_ambience_birds_0)) audio_play_sound(m_ambience_birds_0, 3, true);
		audio_sound_gain(m_ambience_birds_0, 0.01, 0);
		audio_sound_gain(m_ambience_birds_0, birdvolume * obj_controller_all.real_ambience_volume, 15000);
	}
}

// Spawning
var lighting;

if (!global.game_objective_complete){
	lighting = 0.85;
	
	if (hunting){
		if (audio_sound_get_gain(tutmusic_layer0) < 0.01){
			audio_sound_gain(tutmusic_layer0, 0.01, 0);
			audio_sound_gain(tutmusic_layer0, 0.5 * obj_controller_all.real_music_volume, 32000);
		}
	}
}else{
	if (global.cutscene_current != 57){
		var lvol = 1 - (point_distance(global.player_position_x, global.player_position_y, 504, 540) / 1200);
		audio_sound_gain(tutmusic_layer1, clamp(lvol + 0.25, 0, 1) * endscene_music_mult * obj_controller_all.real_music_volume, 0);
	}
	
	lighting = 1;
	
	if (!endscene_initiated){
		scr_effect_flash_script(0.1, 0.1, c_white, scr_trigger_4, false);
		audio_sound_gain(tutmusic_layer1, 0.01, 0);
		
		endscene_initiated = true;
	}
	
	if (endscene_music_mult < 1){
		endscene_music_mult += min(endscene_music_mult_increase, 1 - endscene_music_mult);
	}
}

if (!global.game_pause) && (instance_exists(obj_player)){
	deer_can_spawn = ((obj_controller_ui.tutourial_stage > 1) || (!obj_controller_ui.tutourial))
					&& (scr_enemy_count(false) < 3)
					&& (point_distance(global.player_position_x, global.player_position_y, 530, 550) > 400)
					&& (!global.game_objective_complete);

	if (deer_can_spawn){
		if (deer_spawn_time > 0){
			deer_spawn_time --;
		}else{
			var counter = 0;
			var do_spawn = true;
			
			do{
				var xx = random_range(camx - 10, camx + camw + 10);
				var yy = random_range(camy - 10, camy + camh + 10);
				
				if (counter < 200){
					counter ++;
				}else{
					do_spawn = false;
					show_debug_message("Tried to spawn a deer but couldn't.");
					break;
				}
			}until ((point_distance(xx, yy, 530, 550) > 400) && inroom(xx, yy) && (point_distance(obj_player.x, obj_player.y, xx, yy) > 150) && !collision_rectangle(xx - 30, yy - 20, xx + 30, yy + 20, obj_p_solid, false, true)) && (!place_meeting(xx, yy, obj_interior_fade));
			
			if (do_spawn){
				instance_create(xx, yy, obj_enemy_5);
				
				repeat(18){
					part_particles_create(global.ps_front, xx + random_range(-14, 14), yy + random_range(-7, 9), global.pt_spawn_0, 1);
				}
			}
			
			deer_spawn_time = deer_spawn_time_max;
		}
	}
}

global.game_lighting_level_to = lighting + scr_brightness_offset();

scr_level_combatstate_control();
scr_level_audio_pause_and_resume();
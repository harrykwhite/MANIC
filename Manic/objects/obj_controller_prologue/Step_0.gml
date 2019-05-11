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
	if (random(6) < 1){
		if (part_particles_count(global.pt_smoke_3) < 30){
			part_particles_create(global.ps_front, camx + random_range(0, camw), camy + random_range(0, camh), global.pt_smoke_3, 1);
		}
	}
}

// Wind
if (!global.game_pause){
	if (!audio_is_playing(wind)){
		wind = audio_play_sound(m_ambience_wind_0, 3, true);
		audio_sound_gain(wind, 0, 0);
		audio_sound_gain(wind, 1 * obj_controller_all.real_ambience_volume, 20000);
	}
}else{
	if (audio_is_playing(wind)){
		audio_pause_sound(wind);
	}
}

// Spawning
if (obj_controller_ui.tutourial){
	lighting = 0.7;
}else{
	var to = 0.85;
	
	if (lighting < to){
		lighting += 0.00001;
	}else if (lighting > to){
		lighting -= 0.00001;
	}
}

if (!global.game_pause) && (instance_exists(obj_player)){
	deer_can_spawn = ((obj_controller_ui.tutourial_stage > 1) || (!obj_controller_ui.tutourial))
					&& (instance_number(obj_enemy_5) < 1)
					&& (point_distance(obj_player.x, obj_player.y, 530, 550) > 500);

	if (deer_can_spawn){
		if (deer_spawn_time > 0){
			deer_spawn_time --;
		}else{
			var xx = random_range(camx - 200, camx + camw + 200);
			var yy = random_range(camy - 200, camy + camh + 200);
		
			while (onscreen(xx, yy, -20) || !inroom(xx, yy) || collision_rectangle(xx - 15, yy - 15, xx + 15, yy + 15, obj_p_solid, false, true)){
				xx = random_range(camx - 50, camx + camw + 50);
				yy = random_range(camy - 50, camy + camh + 50);
			}
			
			instance_create(xx, yy, obj_enemy_5);
			
			repeat(9){
				part_particles_create(global.ps_front, xx + random_range(-7, 7), yy + random_range(-18, 18), global.pt_spawn_0, 1);
			}
			
			deer_spawn_time = 60 * random_range(6, 9);
		}
	}
}

global.ambientShadowIntensity = lighting;
global.game_combat_active = false;
scr_level_combatstate_control();
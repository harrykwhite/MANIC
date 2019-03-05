scr_position_view();

if (!global.game_pause){
	
	// Dust
	if (random(2) < 1) part_particles_create(global.ps_front, random_range(camera_get_view_x(view_camera[0]), camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])), random_range(camera_get_view_y(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])), global.pt_dust_3, 1);
	if (random(4) < 1) part_particles_create(global.ps_front, random_range(camera_get_view_x(view_camera[0]), camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])), random_range(camera_get_view_y(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])), global.pt_dust_1, 1);
	
	// Fog
	if (random(2) < 1){
		if (part_particles_count(global.pt_smoke_3) < 40){
			part_particles_create(global.ps_front, camera_get_view_x(view_camera[0])+random_range(0, camera_get_view_width(view_camera[0])), camera_get_view_y(view_camera[0])+random_range(0, camera_get_view_height(view_camera[0])), global.pt_smoke_3, 1);
		}
	}
}

// Spawning
var lighting_level; 
lighting_level[CombatState.Climax] = 1;
lighting_level[CombatState.Buildup] = 0.9;
lighting_level[CombatState.Idle] = 0.8;

if (lighting < lighting_level[global.game_combat_state]){
	lighting += 0.004;
}else if (lighting > lighting_level[global.game_combat_state]){
	lighting -= 0.004;
}

global.ambientShadowIntensity = lighting;
global.game_combat_active = false;
scr_level_music_control();
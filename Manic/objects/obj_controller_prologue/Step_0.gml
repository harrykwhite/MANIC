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
		if (part_particles_count(global.pt_fog_0) < 30){
			part_particles_create(global.ps_front, camx + random_range(0, camw), camy + random_range(0, camh), global.pt_fog_0, 1);
		}
	}
	
	// Birds
	if (random(120) < 1) && (instance_number(obj_bird_0) < 1){
		var bird;
		
		if (random(2) < 1){
			bird = instance_create(camx - 30, random_range(camy, camy + camh), obj_bird_0);
			bird.dir = 360 + random_range(-5, 5);
		}else{
			bird = instance_create(camx + camw + 30, random_range(camy, camy + camh), obj_bird_0);
			bird.dir = 180 + random_range(-5, 5);
		}
	}
}

// Ambience
if (!global.game_pause){
	if (!audio_is_playing(m_ambience_wind_0)){
		audio_play_sound(m_ambience_wind_0, 3, true);
		audio_sound_gain(m_ambience_wind_0, 0, 0);
		audio_sound_gain(m_ambience_wind_0, 1 * obj_controller_all.real_ambience_volume, 15000);
	}
	
	if (!audio_is_playing(m_ambience_birds_0)){
		audio_play_sound(m_ambience_birds_0, 3, true);
		audio_sound_gain(m_ambience_birds_0, 0, 0);
		audio_sound_gain(m_ambience_birds_0, 1 * obj_controller_all.real_ambience_volume, 15000);
	}
}else{
	spawn_pause_update = false;
	audio_pause_all();
}

// Spawning
if (!global.game_objective_complete){
	lighting = 0.75;
}else{
	var to = 0.95;
	
	if (!global.game_pause){
		if (lighting < to){
			lighting += 0.0005;
		}else if (lighting > to){
			lighting -= 0.0005;
		}
	}
	
	if (!endscene_initiated){
		var child0 = inst_3992F7F2;
		var child1 = inst_1FCF6CFC;
		var wife = inst_6C02B40B;
		
		instance_activate_all();
		
		with(obj_bed_small_0){
			fire = true;
		}
		
		with(obj_bed_large_0){
			fire = true;
		}
		
		with(obj_table_0){
			fire = true;
		}
		
		with(obj_chair_0){
			fire = true;
		}
		
		var cratecount = instance_number(obj_crate_0);
		
		for(var i = 0; i < cratecount; i ++){
			var thiscrate = instance_find(obj_crate_0, i);
			
			if (instance_exists(thiscrate)){
				if (thiscrate.x < 1038){
					with(thiscrate){
						var brk = instance_create(x, y, obj_break);
						brk.sprite_index = spr_crate_0_break;
					}
				
					instance_destroy(thiscrate);
				}
			}
		}
		
		var light = instance_create(466, 552, obj_block_light);
		light.size[0] = 560;
		light.time = -1;
		
		var firesound = instance_create(502, 544, obj_block_sound);
		firesound.sound = snd_character_burn_0;
		firesound.radius = 600;
		
		var child0corpse = instance_create(child0.x, child0.y, obj_enemy_corpse);
		child0corpse.sprite_index = spr_player_child_0_corpse_0;
		
		var child1corpse = instance_create(child1.x, child1.y, obj_enemy_corpse);
		child1corpse.sprite_index = spr_player_child_1_corpse_0;
		
		var wifecorpse = instance_create(wife.x, wife.y, obj_enemy_corpse);
		wifecorpse.sprite_index = spr_player_wife_corpse_0;
		
		instance_destroy(child0);
		instance_destroy(child1);
		instance_destroy(wife);
		
		instance_destroy(obj_farmbuilding_3);
		instance_destroy(obj_farmbuilding_4);
		
		var gundrop = instance_create(652, 500, obj_weapondrop);
		gundrop.index = PlayerWeapon.Revolver;
		gundrop.angle = 30;
		
		var knifedrop = instance_create(652 - 10, 500 + 10, obj_weapondrop);
		knifedrop.index = PlayerWeapon.Knife;
		knifedrop.angle = 110;
		
		var robotprop = instance_create_layer(446, 754, "EndingObjects", obj_pawn_other_robotrunning_0);
		robotprop.dir = 180;
		robotprop.dir_to = robotprop.dir;
		
		robotprop = instance_create_layer(562, 570, "EndingObjects", obj_pawn_other_robotrunning_0);
		robotprop.dir = 360;
		robotprop.dir_to = robotprop.dir;
		
		robotprop = instance_create_layer(532, 550, "EndingObjects", obj_pawn_other_robotrunning_0);
		robotprop.dir = 360;
		robotprop.dir_to = robotprop.dir;
		
		robotprop = instance_create_layer(756, 516, "EndingObjects", obj_pawn_other_robotrunning_0);
		robotprop.dir = 270;
		robotprop.dir_to = robotprop.dir
		
		endscene_initiated = true;
	}
}

if (!global.game_pause) && (instance_exists(obj_player)){
	deer_can_spawn = ((obj_controller_ui.tutourial_stage > 1) || (!obj_controller_ui.tutourial))
					&& (instance_number(obj_enemy_5) < 3)
					&& (point_distance(obj_player.x, obj_player.y, 530, 550) > 400)
					&& (!global.game_objective_complete);

	if (deer_can_spawn){
		if (deer_spawn_time > 0){
			deer_spawn_time --;
		}else{
			var counter = 0;
			var dospawn = true;
			
			do{
				var xx = random_range(camx - 10, camx + camw + 10);
				var yy = random_range(camy - 10, camy + camh + 10);
				
				if (counter < 200){
					counter ++;
				}else{
					dospawn = false;
					show_debug_message("Tried to spawn a deer but couldn't.");
					break;
				}
			}until (inroom(xx, yy) && (point_distance(obj_player.x, obj_player.y, xx, yy) > 250) && !collision_rectangle(xx - 30, yy - 20, xx + 30, yy + 20, obj_p_solid, false, true)) && (!place_meeting(xx, yy, obj_interior_fade));
			
			if (dospawn){
				instance_create(xx, yy, obj_enemy_5);
				
				repeat(15){
					part_particles_create(global.ps_front, xx + random_range(-7, 7), yy + random_range(-18, 18), global.pt_spawn_0, 1);
				}
			}
			
			deer_spawn_time = 60 * random_range(9, 12);
		}
	}
}

global.ambientShadowIntensity = lighting;
scr_level_combatstate_control();
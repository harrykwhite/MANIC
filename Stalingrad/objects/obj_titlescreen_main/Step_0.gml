if (room != rm_title_0){
	instance_destroy();
}

#region Effects
var camx = camera_get_view_x(view_camera[0]);
var camy = camera_get_view_y(view_camera[0]);
var camw = camera_get_view_width(view_camera[0]);
var camh = camera_get_view_height(view_camera[0]);

// Dust
if (random(5) < 1) part_particles_create(global.ps_front, camx + random(camw), camy + random(camh), global.pt_dust_0, 1);
if (random(10) < 1) part_particles_create(global.ps_front, camx + random(camw), camy + random(camh), global.pt_dust_1, 1);

// Tumbleweed
if (random(170) < 1){
	if (instance_number(obj_environment_tumbleweed) < 5){
		var xx = camx + random(camw);
		var yy = camy + random(camh);
		var safe = 0;
	
		while(place_meeting(xx, yy, obj_p_solid)){
			xx = camx + random(camw);
			yy = camy + random(camh);
			
			if (safe < 100){
				safe ++;
			}else{
				break;
			}
		}
	
		if (safe < 100){
			instance_create(xx, yy, obj_environment_tumbleweed);
		}
	}
}
	
// Rain
repeat(2){
    part_particles_create(global.ps_front, camera_get_view_x(view_camera[0]) + random_range(-150, camera_get_view_width(view_camera[0])), camera_get_view_y(view_camera[0]) - 10, global.pt_rain_0, 1);
}

if (random(2) < 1){
    part_particles_create(global.ps_bottom, camera_get_view_x(view_camera[0]) + random_range(0, camera_get_view_width(view_camera[0])), camera_get_view_y(view_camera[0]) + random_range(0, camera_get_view_height(view_camera[0])), choose(global.pt_rain_1, global.pt_rain_2), 1);
}

// Fog
if (random(2.5) < 1){
	if (part_particles_count(global.pt_smoke_3) < 40){
		part_particles_create(global.ps_front, camera_get_view_x(view_camera[0]) + random_range(0, camera_get_view_width(view_camera[0])), camera_get_view_y(view_camera[0]) + random_range(0, camera_get_view_height(view_camera[0])), global.pt_smoke_3, 1);
	}
}
#endregion

if (fade){
	if (fade_alpha < 1){
		fade_alpha += fade_speed;
	}else{
		room_goto(fade_goto);
	}
}else{
	var omax = option_max;
	if (in_settings) && (!in_levelselect){
		var omax = option_setting_max;
		if (in_settings_gameplay){
			omax = option_setting_gameplay_max;
		}else if (in_settings_display){
			omax = option_setting_display_max;
		}else if (in_settings_audio){
			omax = option_setting_audio_max;
		}
	}
	
	selected = clamp(selected, 0, omax);
	
	if (fade_opening){
		if (fade_alpha > 0){
			fade_alpha -= 0.05;
		}else{
			fade_alpha = 0;
			fade_opening = false;
		}
		
		fade_alpha = clamp(fade_alpha, 0, 1);
		exit;
	}
	
	if (keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up)){
		if (selected > 0){
			selected--;
		}else{
			selected = omax;
		}
		
		if (!in_settings) && (!in_levelselect){
			while(option_locked[selected]){
				if (selected > 0){
					selected--;
				}else{
					selected = omax;
				}
			}
		}
	}

	if (keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down)){
		if (selected < omax){
			selected ++;
		}else{
			selected = 0;
		}
		
		if (!in_settings) && (!in_levelselect){
			while(option_locked[selected]){
				if (selected < omax){
					selected ++;
				}else{
					selected = 0;
				}
			}
		}
	}
	
	if (in_settings){
		if (in_settings_gameplay){
			if (keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right)){
				if (option_setting_gameplay_value[selected] < option_setting_gameplay_value_max[selected]){
					option_setting_gameplay_value[selected] += option_setting_gameplay_value_interval[selected];
				}else{
					option_setting_gameplay_value[selected] = option_setting_gameplay_value_min[selected];
				}
			}
			
			if (keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left)){
				if (option_setting_gameplay_value[selected] > option_setting_gameplay_value_min[selected]){
					option_setting_gameplay_value[selected] -= option_setting_gameplay_value_interval[selected];
				}else{
					option_setting_gameplay_value[selected] = option_setting_gameplay_value_max[selected];
				}
			}
		}else if (in_settings_display){
			if (keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right)){
				if (option_setting_display_value[selected] < option_setting_display_value_max[selected]){
					option_setting_display_value[selected] += option_setting_display_value_interval[selected];
				}else{
					option_setting_display_value[selected] = 0;
				}
			}
			
			if (keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left)){
				if (option_setting_display_value[selected] > option_setting_display_value_min[selected]){
					option_setting_display_value[selected] -= option_setting_display_value_interval[selected];
				}else{
					option_setting_display_value[selected] = option_setting_display_value_max[selected];
				}
			}
		}else if (in_settings_audio){
			if (keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right)){
				if (option_setting_audio_value[selected] < option_setting_audio_value_max[selected]){
					option_setting_audio_value[selected] += option_setting_audio_value_interval[selected];
				}else{
					option_setting_audio_value[selected] = 0;
				}
			}
			
			if (keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left)){
				if (option_setting_audio_value[selected] > option_setting_audio_value_min[selected]){
					option_setting_audio_value[selected] -= option_setting_audio_value_interval[selected];
				}else{
					option_setting_audio_value[selected] = option_setting_audio_value_max[selected];
				}
			}
		}
	}
	
	if (keyboard_check_pressed(vk_enter)){
		var isvalid = false;
		
		if (!in_settings) && (!in_levelselect){
			isvalid = true;
			switch(selected){
				case 0:
					fade = true;
					fade_goto = rm_level_1_00;
					fade_speed = 0.01;
					global.game_playthrough = true;
					break;
				
				case 1:
					in_levelselect = true;
					break;
				
				case 2:
					in_settings = true;
					break;
				
				case 3:
					game_end();
					break;
			}
		}else if (in_settings) && (!in_levelselect){
			if (!in_settings_gameplay) && (!in_settings_display) && (!in_settings_audio) && (!in_settings_controls){
				isvalid = true;
				switch(selected){
					case 0:
						in_settings_gameplay = true;
						break;
				
					case 1:
						in_settings_display = true;
						break;
				
					case 2:
						in_settings_audio = true;
						break;
				
					case 3:
						in_settings_controls = true;
						break;
				}
			}
		}
		
		if (isvalid){
			selected = 0;
		}
	}
	
	if (keyboard_check_pressed(vk_backspace)){
		var isvalid = false;
		
		if (in_settings) && (!in_levelselect){
			isvalid = true;
			if (!in_settings_gameplay) && (!in_settings_display) && (!in_settings_audio) && (!in_settings_controls){
				in_settings = false;
			}else{
				in_settings_gameplay = false;
				in_settings_display = false;
				in_settings_audio = false;
				in_settings_controls = false;
			}
		}
		
		if (isvalid){
			selected = 0;
		}
	}
}
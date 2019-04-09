scr_position_view();

real_sound_volume = (global.game_option[| Options.SoundVolume] / 100) * (global.game_option[| Options.MasterVolume] / 100);
real_music_volume = (global.game_option[| Options.MusicVolume] / 100) * (global.game_option[| Options.MasterVolume] / 100);
real_ambience_volume = (global.game_option[| Options.AmbienceVolume] / 100) * (global.game_option[| Options.MasterVolume] / 100);

/*
if (sound_loaded){
	audio_group_set_gain(audiogroup_sound, global.game_option[| Options.SoundVolume] / 100, 0);
}

if (music_loaded){
	audio_group_set_gain(audiogroup_music, global.game_option[| Options.MusicVolume] / 100, 0);
}

if (ambience_loaded){
	audio_group_set_gain(audiogroup_ambience, global.game_option[| Options.AmbienceVolume] / 100, 0);
}

// Game volume
var gsound = global.game_sound;
var soundcount = ds_list_size(gsound);
var soundvolume = (global.game_option[| Options.SoundVolume] / 100);

for(var i = 0; i < soundcount; i ++){
	var sound = gsound[| i];
	
	if (audio_is_playing(sound)){
		audio_sound_gain(sound, )
	}
}*/

// Debug
if (keyboard_check_pressed(vk_tab)){
	debug = !debug;
}

// Fullscreen
if (full <= 0){
	if (keyboard_check_pressed(ord("F"))){
		window_set_fullscreen(!window_get_fullscreen());
		global.game_option[| Options.Fullscreen] = window_get_fullscreen();
		full = 40;
		
		scr_options_refresh();
	}
}else{
	full--;
}

/*if (wsize_time <= 0){
	if (keyboard_check_pressed(ord("G"))){
		if (wsize < wsize_max){
			wsize ++;
		}else{
			wsize = 1;
		}
		
		window_set_size(720 * wsize, 405 * wsize);
		window_set_position((display_get_width() / 2) - ((720 * wsize) / 2), (display_get_height() / 2) - ((405 * wsize) / 2))
		display_set_gui_size(1920, 1080);
		wsize_time = 30;
	}
}else{
	wsize_time--;
}*/

// Mouse
if (room != rm_title_0){
	while(!instance_exists(obj_controller_mouse)){
		instance_create(mouse_x, mouse_y, obj_controller_mouse);
	}
}
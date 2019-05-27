if (global.game_pause){
	if (audio_is_playing(sound)){
		audio_pause_sound(sound);
		sound_paused = true;
	}
	return;
}else{
	if (sound_paused){
		audio_resume_sound(sound);
		sound_paused = false;
	}
}

var centerx = camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2);
var centery = camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) / 2);
var dist, vol;

if (!audio_is_playing(sound)) || (index == noone){
	index = audio_play_sound(sound, 3, true);
}

dist = point_distance(x, y, centerx, centery);

if (dist < radius){
	vol = 1 - (dist / radius);
}else{
	vol = 0;
}

vol = clamp(vol, 0, 1);

if (isambient){
	vol *= obj_controller_all.real_ambience_volume;
}else if (ismusic){
	vol *= obj_controller_all.real_music_volume;
}else{
	vol *= obj_controller_all.real_sound_volume;
}

audio_sound_gain(index, vol, 0);
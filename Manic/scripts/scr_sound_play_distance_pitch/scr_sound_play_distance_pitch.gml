/// @param sound
/// @param  loop
/// @param  radius
/// @param min
/// @param max
var snd = argument0;
var loop = argument1;
var radius = argument2;
var pmin = argument3;
var pmax = argument4;
var centerx, centery, vol, dist;

if (!instance_exists(obj_player)){
	if (instance_exists(obj_player_death)){
		centerx = obj_player_death.x;
		centery = obj_player_death.y;
	}else{
		centerx = camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2);
		centery = camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) / 2);
	}
}else{
	centerx = obj_player.x;
	centery = obj_player.y;
}

dist = distance_to_point(centerx, centery);

if (dist < radius){
	vol = 1 - (dist / radius);
}else{
	vol = 0;
}
   
vol = clamp(vol, 0, 1);

var sound = audio_play_sound(snd, 3, loop);
audio_sound_pitch(sound, random_range(pmin, pmax));
audio_sound_gain(sound, vol * obj_controller_all.real_sound_volume, 0);
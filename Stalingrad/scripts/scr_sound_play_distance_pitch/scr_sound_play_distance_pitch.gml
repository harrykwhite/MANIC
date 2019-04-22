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

var centerx = camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) / 2);
var centery = camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0]) / 2);
var dist = distance_to_point(centerx, centery);

if (dist < radius){
	var vol = 1 - (dist / radius);
}else{
	var vol = 0;
}
   
vol = clamp(vol, 0, 1);

var sound = audio_play_sound(snd, 3, loop);
audio_sound_pitch(sound, random_range(pmin, pmax));
audio_sound_gain(sound, vol * obj_controller_all.real_sound_volume, 0);
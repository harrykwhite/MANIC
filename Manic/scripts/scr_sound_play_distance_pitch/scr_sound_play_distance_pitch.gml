///@param sound
///@param  loop
///@param  radius
///@param min
///@param max
var snd = argument0;
var loop = argument1;
var radius = argument2;
var pmin = argument3;
var pmax = argument4;

var sound = scr_sound_play_distance(snd, loop, radius);
audio_sound_pitch(sound, random_range(pmin, pmax));
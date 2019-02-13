/// @param sound
/// @param  loop
/// @param  min_pitch
/// @param  max_pitch
var snd = argument0;
var loop = argument1;
var min_pitch = argument2;
var max_pitch = argument3;

var sound = audio_play_sound(snd, 3, loop);
audio_sound_pitch(sound, random_range(min_pitch, max_pitch));

return sound;
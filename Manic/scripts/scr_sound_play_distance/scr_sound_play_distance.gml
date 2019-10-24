///@param sound
///@param  loop
///@param  radius
var snd = argument0;
var loop = argument1;
var radius = argument2;

var dist = point_distance(x, y, global.player_position_x, global.player_position_y);

if (dist < radius){
	var vol = 1 - (dist / radius);
}else{
	var vol = 0;
}

vol *= obj_controller_all.real_sound_volume;
vol = clamp(vol, 0, 1);

var sound = audio_play_sound(snd, 3, loop);
audio_sound_gain(sound, vol, 0);

show_debug_message(audio_get_name(snd));

return sound;
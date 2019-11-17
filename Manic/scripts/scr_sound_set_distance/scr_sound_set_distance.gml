///@param soundid
///@param  radius
var snd = argument0;
var radius = argument1;

var vol = 0;
var dist = point_distance(x, y, global.player_position_x, global.player_position_y);

if (dist < radius){
	vol = 1 - (dist / radius);
}

vol = clamp(vol, 0, 1);

vol *= obj_controller_all.real_sound_volume;
audio_sound_gain(snd, vol, 0);
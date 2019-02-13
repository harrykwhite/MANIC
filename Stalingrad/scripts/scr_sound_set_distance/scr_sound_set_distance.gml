/// @param soundid
/// @param  radius
var snd = argument0;
var radius = argument1;
var vol = 0;

if (instance_exists(global.player)){
    if (distance_to_object(global.player) < radius){
        vol = 1 - (distance_to_object(global.player) / radius);
    }
    
	vol = clamp(vol, 0, 1);
}

audio_sound_gain(snd, vol, 0);
///@param soundid
///@param  radius
var snd = argument0;
var radius = argument1;
var vol = 0;

if (instance_exists(obj_player)){
    if (distance_to_object(obj_player) < radius){
        vol = 1 - (distance_to_object(obj_player) / radius);
    }
    
	vol = clamp(vol, 0, 1);
}

vol *= obj_controller_all.real_sound_volume;
audio_sound_gain(snd, vol, 0);
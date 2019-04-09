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

if (instance_exists(obj_player)){
    if (distance_to_object(obj_player) < radius){
        var vol = 1 - (distance_to_object(obj_player) / radius);
    }else{
        var vol = 0;
    }
    
	vol = clamp(vol, 0, 1);
	
    var sound = audio_play_sound(snd, 3, loop);
    audio_sound_pitch(sound, random_range(pmin, pmax));
	audio_sound_gain(sound, vol * obj_controller_all.real_sound_volume, 0);
}

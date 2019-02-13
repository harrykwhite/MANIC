/// @param sound
/// @param  loop
/// @param  radius
var snd = argument0;
var loop = argument1;
var radius = argument2;

if (instance_exists(global.player)){
    if (distance_to_object(global.player) < radius){
        var vol = 1 - (distance_to_object(global.player) / radius);
    }else{
        var vol = 0;
    }
    
	vol = clamp(vol, 0, 1);
	
    var sound = audio_play_sound(snd, 3, loop);
    audio_sound_gain(sound, vol, 0);
}

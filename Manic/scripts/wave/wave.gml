/// @param from
/// @param  to
/// @param  duration
/// @param  offset
/// @param  activeOnPause
var from = argument[0];
var to = argument[1];
var duration = argument[2];
var offset = argument[3];
var activeOnPause = false;

if (argument_count == 5){
	activeOnPause = argument[4];
}

if (!activeOnPause){
	if (global.game_pause){
		return;
	}
}

a4 = (to - from) * 0.5;
return from + a4 + sin((((current_time * 0.001) + duration * offset) / duration) * (pi * 2)) * a4;
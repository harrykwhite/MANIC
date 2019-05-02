///@param pause
var pause = argument0;

if (global.game_pause != pause){
	global.game_pause = pause;
	part_system_automatic_update(global.ps_bottom, !pause);
	part_system_automatic_update(global.ps_front, !pause);
}
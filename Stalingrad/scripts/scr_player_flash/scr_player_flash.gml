///scr_player_flash(time);
var time = argument0;

if (instance_exists(global.player)){
	global.player.flash_time = time;
}
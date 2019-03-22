///scr_player_flash(time);
var time = argument0;

if (instance_exists(obj_player)){
	obj_player.flash_time = time;
}
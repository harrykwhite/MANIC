///@param index
var index = argument0;

global.upgrade_equipped[index] = true;

if (instance_exists(obj_player)){
	scr_player_upgrade_refresh();
	obj_player.surrounding_light_to -= obj_player.surrounding_light_upgradedec;
}
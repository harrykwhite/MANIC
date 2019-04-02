///@param index
var index = argument0;
var upgrades = global.player_upgrades;

if (ds_list_find_index(upgrades, index) == -1){
	ds_list_add(upgrades, index);
}
///@param index
var index = argument0;

return global.upgrade_equipped[index]
|| (global.game_is_playthrough && global.game_save_upgrade_unlocked[index]);
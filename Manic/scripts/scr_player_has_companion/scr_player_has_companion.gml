///@param obj
var obj = argument0;
var height = ds_grid_height(global.player_companions);

for(var i = 0; i < height; i ++){
	if (global.player_companions[# 0, i] == obj){
		return true;
	}
}

return false;
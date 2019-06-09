///@param obj
var obj = argument0;
var height = ds_grid_height(global.player_companions);

for(var i = 0; i < height; i ++){
	if (global.player_companions[# 0, i].object_index == obj){
		global.player_companions[# 0, i] = -1;
		global.player_companions[# 1, i] = -1;
		return;
	}
}
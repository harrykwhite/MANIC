var height = ds_grid_height(global.player_companions);
var counter = 0;

ds_grid_sort(global.player_companions, 0, false);

for(var i = 0; i < height; i ++){
	if (global.player_companions[# 0, i] == id){
		return counter;
	}else{
		if (global.player_companions[# 0, i] != -1){
			counter ++;
		}
	}
}
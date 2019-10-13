if (!ds_exists(ds_depth_grid, ds_type_list)){
	ds_depth_grid = ds_grid_create(2, ds_depth_grid_height);
}

var grid = ds_depth_grid;
var height = ds_depth_counter;
var yy = 0;
ds_grid_sort(grid, 1, true);

repeat(height){
	var instance = grid[# 0, yy];
	
	if (instance != noone && instance != undefined){
		with(instance){
			event_user(0);
		}
	}
	
	yy ++;
}

ds_depth_counter = 0;
ds_grid_clear(grid, min(max(7000, room_height), 7000));
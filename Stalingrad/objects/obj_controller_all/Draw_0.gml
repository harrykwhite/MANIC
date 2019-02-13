// Layer System
if (!ds_exists(ds_depth_grid, ds_type_grid)){
	ds_depth_grid = ds_grid_create(4, 1);
}

var gHeight = ds_grid_height(ds_depth_grid);
var yy = 0;

// Order the grid so that objects with the lowest y co-ordinates are drawn first.
ds_grid_sort(ds_depth_grid, 1, true);

// Draw all of the instances in order.
repeat(gHeight){
	
	// Draw the instance.
	var instanceself = ds_depth_grid[# 0, yy];
	var scriptself  = ds_depth_grid[# 2, yy];
	var prescriptself = ds_depth_grid[# 3, yy];
	
	with(instanceself){
		
		// Perform pre draw attributes.
		if (prescriptself != -1) && (prescriptself != 0){
			script_execute(prescriptself);
		}
		
		draw_self();
		
		// Perform draw attributes.
		if (scriptself != -1) && (scriptself != 0){
			script_execute(scriptself);
		}
	}
	
	yy++;
}

ds_grid_clear(ds_depth_grid, noone);
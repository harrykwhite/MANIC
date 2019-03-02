// Layer System
if (!ds_exists(ds_depth_grid, ds_type_grid)){
	ds_depth_grid = ds_grid_create(4, 1);
}

var yy = 0;
ds_grid_resize(ds_depth_grid, 4, global.depth_counter + 1);

// Order the grid so that objects with the lowest y co-ordinates are drawn first.
ds_grid_sort(ds_depth_grid, 1, true);

// Draw all of the instances in order.
repeat(global.depth_counter){
	
	// Draw the instance.
	var instanceself = ds_depth_grid[# 0, yy];
	var scriptself  = ds_depth_grid[# 2, yy];
	var prescriptself = ds_depth_grid[# 3, yy];
	
	with(instanceself){
		
		// Perform pre draw attributes.
		if (prescriptself != -1) && (prescriptself != 0){
			script_execute(prescriptself);
		}
		
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
		
		// Perform draw attributes.
		if (scriptself != -1) && (scriptself != 0){
			script_execute(scriptself);
		}
	}
	
	yy++;
}

ds_grid_clear(ds_depth_grid, noone);
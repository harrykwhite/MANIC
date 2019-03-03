// Layer System
var size = instance_number(obj_p_depth)
+ instance_number(obj_p_depth_burn)
+ instance_number(obj_p_depth_decorative)
+ instance_number(obj_p_depth_environhit)
+ instance_number(obj_p_depth_solid_noshadow)
+ instance_number(obj_p_depth_solid_shadow);

if (!ds_exists(ds_depth_grid, ds_type_grid)){
	ds_depth_grid = ds_grid_create(4, size);
}

// Resize the grid to the number of objects being drawn.
ds_grid_resize(ds_depth_grid, 4, size);
var yy = 0;
var yyh = ds_grid_height(ds_depth_grid);

// Order the grid so that objects with the lowest y co-ordinates are drawn first.
ds_grid_sort(ds_depth_grid, 1, true);

// Draw all of the instances in order.
repeat(size){
	if (yy >= yyh){
		break;
	}
	
	// Draw the instance.
	var instanceself = ds_depth_grid[# 0, yy];
	var scriptself  = ds_depth_grid[# 2, yy];
	var prescriptself = ds_depth_grid[# 3, yy];
	
	with(instanceself){
		
		// Perform pre draw attributes.
		if (prescriptself != -1){
			script_execute(prescriptself);
		}
		
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
		
		// Perform draw attributes.
		if (scriptself != -1){
			script_execute(scriptself);
		}
	}
	
	yy++;
}

ds_grid_clear(ds_depth_grid, noone);
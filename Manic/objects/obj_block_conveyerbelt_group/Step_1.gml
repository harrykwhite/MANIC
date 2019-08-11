if (!instances_set){
	var type0 = ds_list_create();
	var type1 = ds_list_create();
	var type2 = ds_list_create();
	
	var type0_count = collision_rectangle_list(check_x1, check_y1, check_x2, check_y2, obj_conveyerbelt_0, false, true, type0, false);
	var type1_count = collision_rectangle_list(check_x1, check_y1, check_x2, check_y2, obj_conveyerbelt_1, false, true, type1, false);
	var type2_count = collision_rectangle_list(check_x1, check_y1, check_x2, check_y2, obj_conveyerbelt_2, false, true, type2, false);
	
	for(var i = 0; i < type0_count; i ++){
		ds_list_add(instances, type0[| i]);
	}
	
	for(var i = 0; i < type1_count; i ++){
		ds_list_add(instances, type1[| i]);
	}
	
	for(var i = 0; i < type2_count; i ++){
		ds_list_add(instances, type2[| i]);
	}
	
	ds_list_destroy(type0);
	ds_list_destroy(type1);
	ds_list_destroy(type2);
}
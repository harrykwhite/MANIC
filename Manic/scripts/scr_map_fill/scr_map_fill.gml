var camx = camera_get_view_x(view_camera[0]); camx -= 20;
var camy = camera_get_view_y(view_camera[0]); camy -= 20;

var camw = camera_get_view_width(view_camera[0]); camw += 40;
var camh = camera_get_view_height(view_camera[0]); camh += 40;

// Objects
var objs, objs_type, objs_counter = 0;

objs[objs_counter] = obj_block_solid;
objs_type[objs_counter] = 0;
objs_counter ++;

objs[objs_counter] = obj_bunker_wall_0;
objs_type[objs_counter] = 0;
objs_counter ++;

objs[objs_counter] = obj_bunker_wall_1;
objs_type[objs_counter] = 0;
objs_counter ++;

objs[objs_counter] = obj_prisonbar_0;
objs_type[objs_counter] = 3;
objs_counter ++;

objs[objs_counter] = obj_prisonbar_3;
objs_type[objs_counter] = 3;
objs_counter ++;

objs[objs_counter] = obj_bossgate_0;
objs_type[objs_counter] = 0;
objs_counter ++;

objs[objs_counter] = obj_bossgate_1;
objs_type[objs_counter] = 0;
objs_counter ++;

objs[objs_counter] = obj_fence_0;
objs_type[objs_counter] = 1;
objs_counter ++;

objs[objs_counter] = obj_fence_1;
objs_type[objs_counter] = 1;
objs_counter ++;

objs[objs_counter] = obj_fence_2;
objs_type[objs_counter] = 1;
objs_counter ++;

objs[objs_counter] = obj_fence_3;
objs_type[objs_counter] = 1;
objs_counter ++;

objs[objs_counter] = obj_fence_4;
objs_type[objs_counter] = 1;
objs_counter ++;

objs[objs_counter] = obj_fence_5;
objs_type[objs_counter] = 1;
objs_counter ++;

objs[objs_counter] = obj_fence_6;
objs_type[objs_counter] = 1;
objs_counter ++;

objs[objs_counter] = obj_spearfence_0;
objs_type[objs_counter] = 2;
objs_counter ++;

objs[objs_counter] = obj_spearfence_1;
objs_type[objs_counter] = 2;
objs_counter ++;

objs[objs_counter] = obj_snowbuilding_0;
objs_type[objs_counter] = 0;
objs_counter ++;

objs[objs_counter] = obj_snowbuilding_3;
objs_type[objs_counter] = 0;
objs_counter ++;

objs[objs_counter] = obj_snowbuilding_4;
objs_type[objs_counter] = 0;
objs_counter ++;

objs[objs_counter] = obj_snowbuilding_5;
objs_type[objs_counter] = 0;
objs_counter ++;

objs[objs_counter] = obj_farmbuilding_0;
objs_type[objs_counter] = 0;
objs_counter ++;

objs[objs_counter] = obj_destroyedbuilding_0;
objs_type[objs_counter] = 0;
objs_counter ++;

objs[objs_counter] = obj_factorybuilding_0;
objs_type[objs_counter] = 0;
objs_counter ++;

objs[objs_counter] = obj_citybuilding_0;
objs_type[objs_counter] = 0;
objs_counter ++;

objs[objs_counter] = obj_citybuilding_6;
objs_type[objs_counter] = 0;
objs_counter ++;

objs[objs_counter] = obj_bunkerbuilding_0;
objs_type[objs_counter] = 0;
objs_counter ++;

objs[objs_counter] = obj_prisonbuilding_0;
objs_type[objs_counter] = 0;
objs_counter ++;

objs[objs_counter] = obj_cityheadquarters_building_0;
objs_type[objs_counter] = 0;
objs_counter ++;

objs[objs_counter] = obj_tree_0;
objs_type[objs_counter] = 1;
objs_counter ++;

objs[objs_counter] = obj_tree_1;
objs_type[objs_counter] = 1;
objs_counter ++;

objs[objs_counter] = obj_tree_2;
objs_type[objs_counter] = 1;
objs_counter ++;

objs[objs_counter] = obj_tree_3;
objs_type[objs_counter] = 1;
objs_counter ++;

objs[objs_counter] = obj_tree_4;
objs_type[objs_counter] = 1;
objs_counter ++;

objs[objs_counter] = obj_tree_5;
objs_type[objs_counter] = 1;

// Solid
if (instance_exists(obj_p_solid)){
	for(var yy = 0; yy < room_height; yy += map_tile_height){
		for(var xx = 0; xx < room_width; xx += map_tile_width){
			var list = ds_list_create();
			var listcount = collision_rectangle_list(xx, yy, xx + map_tile_width - 1, yy + map_tile_height - 1, obj_p_solid, false, false, list, false);
			var found_ind = -1;
			
			if (listcount > 0){
				for(var l = 0; l < listcount; l ++){
					var obj = list[| l].object_index;
					
					for(var o = 0; o < objs_counter; o ++){
						if (obj == objs[o]){
							found_ind = o;
							break;
						}
					}
					
					if (found_ind != -1){
						map[xx div map_tile_width, yy div map_tile_height] = objs_type[found_ind];
						break;
					}
				}
			}
			
			ds_list_destroy(list);
		}
	}
}
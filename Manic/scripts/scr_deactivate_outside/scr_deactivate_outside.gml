var wrange = 30;
var hrange = 30;

var x1 = camera_get_view_x(view_camera[0]) - wrange;
var y1 = camera_get_view_y(view_camera[0]) - hrange;
var x2 = x1 + camera_get_view_width(view_camera[0]) + (wrange * 2);
var y2 = y1 + camera_get_view_height(view_camera[0]) + (hrange * 2);

var objs, objs_length;

objs[0] = obj_grass_small_0;
objs[1] = obj_grass_small_1;
objs[2] = obj_grass_medium_0;
objs[3] = obj_grass_medium_1;
objs[4] = obj_grass_bush_0;
objs[5] = obj_grass_bush_1;
objs[6] = obj_spear_ground_0;
objs[7] = obj_spear_ground_1;
objs[8] = obj_environment_can_0;
objs[9] = obj_environment_can_1;
objs[10] = obj_environment_skeleton_part;
objs[11] = obj_rock_small_0;
objs[12] = obj_rock_small_1;
objs[13] = obj_rock_large_0;
objs[14] = obj_rock_large_1;
objs[15] = obj_weapondrop;
objs[16] = obj_collectable_pickup;
objs[17] = obj_environment_soldier_head;
objs[18] = obj_environment_soldier_limbs;
objs[19] = obj_environment_corpse;

objs_length = array_length_1d(objs);

for(var o = 0; o < objs_length; o ++){
	var obj = objs[o], obj_is_weapondrop;
	var obj_count = instance_number(obj);
	
	obj_is_weapondrop = (obj == obj_weapondrop);
	
	instance_activate_object(obj);
	
	for(var i = 0; i < obj_count; i ++){
		var inst = instance_find(obj, i);
		
		if (instance_exists(inst)){
			if (obj_is_weapondrop){
				if (inst.spd > 0){
					continue;
				}
			}
			
			if (inst.x < x1) || (inst.y < y1) || (inst.x > x2) || (inst.y > y2){
				instance_deactivate_object(inst);
			}
		}
	}
}
///@param stop_completely
var stop_completely = false;

if (argument_count > 0){
	stop_completely = argument[0];
}

if (instance_exists(inst_18E1EC84)){ instance_destroy(inst_18E1EC84); }
if (instance_exists(inst_1E60D0F5)){ instance_destroy(inst_1E60D0F5); }
if (instance_exists(inst_63C69FB8)){ instance_destroy(inst_63C69FB8); }

var nearest_group = instance_nearest(obj_player.x, obj_player.y, obj_block_conveyerbelt_group);
var nearest_group_count = 0;

if (nearest_group != noone){
	nearest_group_count = ds_list_size(nearest_group.instances);
	
	for(var i = 0; i < nearest_group_count; i ++){
		var inst = nearest_group.instances[| i];
		inst.stop = true;
		
		if (stop_completely){
			inst.spd = 0;
			inst.image_speed = 0;
			inst.image_index = 0;
		}
	}
}
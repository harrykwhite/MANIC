///@param stop_completely
var stop_completely = false;

if (argument_count > 0){
	stop_completely = argument[0];
}

var soundblock = instance_nearest(global.player_position_x, global.player_position_y, obj_block_sound);
if (instance_exists(soundblock)){ instance_destroy(soundblock); }

var nearest_group = instance_nearest(global.player_position_x, global.player_position_y, obj_block_conveyerbelt_group);
var nearest_group_count = 0;

if (nearest_group != noone){
	nearest_group_count = ds_list_size(nearest_group.instances);
	
	for(var i = 0; i < nearest_group_count; i ++){
		var inst = nearest_group.instances[| i];
		
		if (instance_exists(inst)){
			inst.stop = true;
		
			if (stop_completely){
				inst.spd = 0;
				inst.image_speed = 0;
				inst.image_index = 0;
			}
		}
	}
}